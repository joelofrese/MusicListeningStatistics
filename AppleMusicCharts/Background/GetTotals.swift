//
//  GetTotals.swift
//  AppleMusicCharts
//
//  Created by Joe Lofrese on 1/12/22.
//

import Foundation
import CSV

// Returns songs and artists sorted by play count
func getTotals() -> ([Song], [Artist]) {
    
    // Read file
    let pathName = Bundle.main.url(forResource: "CSV Test 4 copy", withExtension: "csv")!
    let stream = InputStream(url: pathName)!
    let csv = try! CSVReader(stream: stream)
    
    // Create dictionary mapping songs to play count
    let artistSongTotals = createSongTotals(csv: csv)
    
    // Sort songs by highest play count
    let sortedSongs = sortedSongs(artistSongTotals: artistSongTotals)
    
    // Sort artists by highest play count
    let sortedArtists = sortedArtists(artistSongTotals: artistSongTotals)
    
    // Return sorted songs, sorted artists
    return (sortedSongs, sortedArtists)
}

// Returns dictionary mapping songs ([artist, song, genre]) to play count
func createSongTotals(csv: CSVReader) -> [[String]: Int] {
    
    // Total dictionary and temporary key
    var artistSongTotals = [[String]: Int]()
    var artistSongTotal = [String]()

    // Until end
    csv.next()
    while let row = csv.next() {
        
        // If finished track
        if row[10] == "NATURAL_END_OF_TRACK" {
            
            // Set temporary key to artist, song, and genre
            artistSongTotal = [row[2], row[5], row[17]]
            
            // If there's a match, add to play count
            if artistSongTotals.keys.contains(artistSongTotal) {
                artistSongTotals[artistSongTotal]! += 1
            }
            
            // Else, add and set play count to 1
            else {
                artistSongTotals[artistSongTotal] = 1
            }
        }
    }
    
    // Return dictionary
    return artistSongTotals
}

// Returns Songs sorted by play count
func sortedSongs(artistSongTotals: [[String]: Int]) -> [Song] {
    return convertToSongsStructure(songsDictionary: artistSongTotals.sorted { $0.1 > $1.1 })
}

// Returns array for each artists with their play count and songs, sorted by play count
func sortedArtists(artistSongTotals: [[String]: Int]) -> [Artist] {
    
    // Sort songs by artist
    let artistSongTotalsAlphabetical = artistSongTotals.sorted { $0.0[0] < $1.0[0] }
    
    // Set artistTotals to empty disctionary ([artist: [[artist play count][song, genre, song play count]...])
    var artistTotals = [String: [[String]]]()
    var previousArtist = ""
    
    // For each element
    for each in artistSongTotalsAlphabetical {
        
        // If new artist, set artist play count to song play count and add song, genre, and song play count
        if each.key[0] != previousArtist {
            artistTotals[each.key[0]] = [[String(each.value)], [each.key[1], each.key[2], String(each.value)]]
            previousArtist = each.key[0]
        }
        
        // Else, add to artist play count and add song, genre, and song play count in sorted order
        else {
            artistTotals[each.key[0]]![0][0] = String(Int(artistTotals[each.key[0]]![0][0])! + each.value)
            artistTotals[each.key[0]]!.insert([each.key[1], each.key[2], String(each.value)], at: sortedSongIndex(allSongs: artistTotals[each.key[0]]!, currentPlayCount: each.value))
        }
    }
    
    // Return sorted artist arrays and total artists
    return (sortArtists(artistTotals: artistTotals))
}

// Returns artists sorted by play count
func sortArtists(artistTotals: [String: [[String]]]) -> [Artist] {
    return convertToArtistsStructure(artistsDictionary: artistTotals.sorted { Int($0.1[0][0])! > Int($1.1[0][0])! })
}

// Converts dictionary mapping songs ([artist, song, genre]) to play count to array of Songs
func convertToSongsStructure(songsDictionary: [Dictionary<[String], Int>.Element]) -> [Song] {
    
    // Create Songs array and temp Song
    var songs: [Song] = []
    var song: Song
    
    // For each element
    for eachElement in songsDictionary {
        
        // Clear temp
        song = Song()
        
        // Set values
        song.artistName = eachElement.key[0]
        song.songName = eachElement.key[1]
        song.genre = eachElement.key[2]
        song.plays = eachElement.value
        
        // Add to array
        songs.append(song)
    }
    
    // Return Songs array
    return songs
}

// Converts dictionary of artists ([artist: [[artist play count][song, genre, song play count]...]) to array of Artists
func convertToArtistsStructure(artistsDictionary: [Dictionary<String, [[String]]>.Element]) -> [Artist] {
    
    // Create artists array and temp artist
    var artists: [Artist] = []
    var artist: Artist
    
    // For each element
    for each in artistsDictionary {
        
        // Clear temp
        artist = Artist()
        
        // Set values
        artist.name = each.key
        artist.plays = Int(each.value[0][0])!
        artist.genre = each.value[1][1]
        
        artist.songs = convertToSongStructureArtist(artist: each.key, songsList: each.value[1 ..< each.value.endIndex])
        
        // Add to array
        artists.append(artist)
    }
    
    // Return artists array
    return artists
}

// Converts from string array to array of songs
func convertToSongStructureArtist(artist: String, songsList: ArraySlice<[String]>) -> [Song] {
    
    // Create songs array and temp song
    var songs: [Song] = []
    var song: Song
    
    // For each element
    for each in songsList {
        
        // Clear temp
        song = Song()
        
        //Set values
        song.artistName = artist
        song.songName = each[0]
        song.genre = each[1]
        song.plays = Int(each[2]) ?? 0
        
        // Add to array
        songs.append(song)
    }
    
    // Return songs array
    return songs
}


// Returns sorted index to insert song
func sortedSongIndex (allSongs: [[String]], currentPlayCount: Int) -> Int {
    
    // For each sorted song
    for i in 1 ..< allSongs.endIndex {
        
        // If play count is higher, return index
        if currentPlayCount >= Int(allSongs[i][2])! {
            return i
        }
    }
    
    // Else, return last index
    return allSongs.endIndex
}
