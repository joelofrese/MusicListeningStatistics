//
//  ContentView.swift
//  AppleMusicCharts
//
//  Created by Joe Lofrese on 1/11/22.
//

import SwiftUI
import MusicKit

struct ContentView: View {
    @Binding var artists: [Artist]
    
    var body: some View {
        ArtistsList(artists: $artists)
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView(artists: .constant(artistsPreviews))
//    }
//}
