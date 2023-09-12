//
//  ArtistsList.swift
//  AppleMusicCharts
//
//  Created by Joe Lofrese on 1/13/22.
//

import SwiftUI

struct ArtistsList: View {
    @Binding var artists: [Artist]
    var body: some View {
        NavigationView {
            List($artists) { artist in
                NavigationLink {
                    ArtistDetail(artist: artist)
                } label: {
                    ArtistRow(artist: artist)
                }
            }
            .navigationTitle("Top Artists")
        }
    }
}

//struct ArtistsList_Previews: PreviewProvider {
//    static var previews: some View {
//        ArtistsList(artists: .constant(artistsPreviews))
//    }
//}

