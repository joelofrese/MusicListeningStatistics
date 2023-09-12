//
//  ContentView.swift
//  AppleMusicCharts
//
//  Created by Joe Lofrese on 1/11/22.
//
/*
import SwiftUI
import MusicKit

struct ContentView: View {
    var body: some View {
        SwiftUIView1()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SwiftUIView1: View {

    var body: some View {
        
        Button("lols") {
            
        Task {
            let status = await MusicAuthorization.request()
        }
        }
        
        Button("lol") {
            
        Task {
            try! await testFunct()
        }
        }
    }
}

func testFunct() async throws {
    
    for var eachArtist in artists{
        
        for eachSong in eachArtist.songs {
            
            let detailedArtist = MusicCatalogSearchRequest(term: eachArtist.name + " " + eachSong.name, types: [MusicKit.Song.self])
            
            let response = try await detailedArtist.response()
            
            if response.songs[0].albums?[0].artwork?.url(width: 400, height: 400) != nil {
                eachArtist.image = UIImage(data: try Data(contentsOf: (response.songs[0].albums?[0].artwork?.url(width: 400, height: 400))!))
                
            break
            }
        }
    }
}
*/
