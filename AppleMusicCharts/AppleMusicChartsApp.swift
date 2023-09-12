//
//  AppleMusicChartsApp.swift
//  AppleMusicCharts
//
//  Created by Joe Lofrese on 3/19/22.
//

import SwiftUI
import MusicKit

@main

struct AppleMusicChartsApp: App {
    
    @State var artists = (getTotals().1)
    
    var body: some Scene {
        WindowGroup {
            ContentView(artists: $artists)
//                .task {
//                    await getArtistsData(Artists: &artists)
//                }
        }
    }
}
