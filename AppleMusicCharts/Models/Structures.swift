//
//  ArtistTotals.swift
//  AppleMusicCharts
//
//  Created by Joe Lofrese on 1/12/22.
//


import Foundation
import SwiftUI
import MusicKit

// Artist structure
struct Artist: Identifiable {
    
    // Declare Variables
    var id: UUID
    var artistID: MusicItemID?
    var name: String
    var plays: Int
    var songs: [Song]
    var genre: String
    var image: UIImage
    var found: Bool
    
    // Initialize variables
    init() {
        id = UUID()
        artistID = nil
        name = ""
        plays = 0
        songs = []
        genre = ""
        image = UIImage(named: "Default")!
        found = false
    }
}

// Song structure
struct Song: Identifiable {
    
    // Declare variables
    var id: UUID
    var songID: MusicKit.Song?
    var artistName: String
    var songName: String
    var genre: String
    var plays: Int
    var found: Bool
    
    // Initialize variables
    init() {
        id = UUID()
        songID = nil
        artistName = ""
        songName = ""
        genre = ""
        plays = 0
        found = false
    }
}

// Song structure
//struct ArtistSong: Identifiable {
//
//    // Declare variables
//    var id: UUID
//    var name: String
//    var genre: String
//    var plays: Int
//    var found: Bool
//
//    // Initialize variables
//    init() {
//        id = UUID()
//        name = ""
//        genre = ""
//        plays = 0
//        found = false
//    }
//}
