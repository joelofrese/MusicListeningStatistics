//
//  ArtistTotals.swift
//  AppleMusicCharts
//
//  Created by Joe Lofrese on 1/12/22.
//


import Foundation
import SwiftUI

// Artist structure
struct Artist: Identifiable {
    
    // Declare Variables
    var id: UUID
    var name: String
    var plays: Int
    var songs: [ArtistSong]
    var genre: String
    var image: UIImage?
    
    // Initialize variables
    init() {
        id = UUID()
        name = ""
        plays = 0
        songs = [ArtistSong()]
        genre = ""
        image = nil
    }
}

// Song structure
struct Song: Identifiable {
    
    // Declare variables
    var id: UUID
    var artistName: String
    var songName: String
    var genre: String
    var plays: Int
    
    // Initialize variables
    init() {
        id = UUID()
        artistName = ""
        songName = ""
        genre = ""
        plays = 0
    }
}

// Song structure
struct ArtistSong: Identifiable {
    
    // Declare variables
    var id: UUID
    var name: String
    var genre: String
    var plays: Int
    var found: Bool
    
    // Initialize variables
    init() {
        id = UUID()
        name = ""
        genre = ""
        plays = 0
        found = false
    }
}
