//
//  ArtistRow.swift
//  AppleMusicCharts
//
//  Created by Joe Lofrese on 1/12/22.
//

import SwiftUI
import MusicKit

struct ArtistRow: View {
    
    @Binding var artist: Artist
//    @Binding var foundTrue: Bool
    
    var body: some View {
        
        HStack {
            CircleImage(image: artist.image)
            VStack(alignment: .leading) {
                Text(artist.name)
                    .font(.title)
                HStack {
                    Text("\(artist.plays) Plays - \(artist.genre)")
                        .font(.subheadline)
                    Spacer()
                    Text("\(artist.songs.endIndex) Songs")
                        .font(.subheadline)
                }
            }
        }
        .padding(.vertical)
        .task {
            await getArtistData(Artist: &artist)
        }
    }

//    struct ArtistRow_Previews: PreviewProvider {
//        static var previews: some View {
//            Group {
//                ArtistRow(artist: .constant(artistsPreviews[0]))
//            }
//            .previewLayout(.fixed(width: 300, height: 70))
//        }
//    }

}

