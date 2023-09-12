//
//  GetData.swift
//  AppleMusicCharts
//
//  Created by Joe Lofrese on 12/24/22.
//

import Foundation
import MusicKit
import UIKit

func getArtistsData(Artists: inout [Artist]) async -> Void {
    
    await MusicAuthorization.request()
    
    for index in 0..<Artists.endIndex {
        await getArtistData(Artist: &Artists[index])
    }
    
}

func getArtistData(Artist: inout Artist) async -> Void {
    
    if Artist.found {
        return
    }
    
    var mostLikelyArtists = [MusicItemID: Int]()
    var tempResults: MusicCatalogSearchResponse
    
    for index in 0..<Artist.songs.count {
        
        do {
            tempResults = try await MusicCatalogSearchRequest(term: Artist.songs[index].songName + " " + Artist.name, types: [MusicKit.Song.self, MusicKit.Artist.self, MusicKit.Album.self]).response()
            
            if tempResults.songs.isEmpty {
                print(Artist.songs[index].songName + " by " + Artist.name + " was not found (returned no results).")
                continue
            }
            
            let tempSong = (tempResults.songs[0])
            
            if (tempSong.title != Artist.songs[index].songName || tempSong.artistName != Artist.name) {
                print(Artist.songs[index].songName + " by " + Artist.name + " was not found (top result was " + tempSong.title + " by " + tempSong.artistName + ").")
                continue
            }
            
            Artist.songs[index].songID = tempSong
            Artist.songs[index].found = true
            
            if tempResults.artists.isEmpty {
                print(Artist.songs[index].songName + " by " + Artist.name + " artist was not found (returned no results).")
                continue
            }
            
            let tempArtist = tempResults.artists[0]
            
            if (tempArtist.name != Artist.name) {
                print(Artist.songs[index].songName + " by " + Artist.name + " artist was not found (top result was " + tempArtist.name + ").")
                continue
            }
            
            if mostLikelyArtists.keys.contains(Dictionary<MusicItemID, Int>.Keys.Element(tempArtist.id.rawValue)) {
                mostLikelyArtists[MusicItemID(tempArtist.id.rawValue)]! += 1
            }
            else {
                mostLikelyArtists[MusicItemID(tempArtist.id.rawValue)] = 1
            }
            
        }
        catch {
            
        }
        
    }
    
    if !mostLikelyArtists.isEmpty {
        Artist.artistID = mostLikelyArtists.sorted { $0.1 > $1.1 }[0].key
        do {
            let tempArtist = try await MusicCatalogResourceRequest<MusicKit.Artist>(matching: \.id, equalTo: Artist.artistID!).response().items[0]
            Artist.found = true
            if tempArtist.artwork != nil {
                Artist.image = try UIImage(data: Data(contentsOf: (tempArtist.artwork!.url(width: tempArtist.artwork!.maximumWidth, height: tempArtist.artwork!.maximumHeight))!)) ?? Artist.image
            }
        }
        catch {
        }
    }
    
}
