//
//  SongRow.swift
//  AppleMusicCharts
//
//  Created by Joe Lofrese on 12/26/22.
//

import SwiftUI
import MusicKit

struct SongRow: View {
    
    @Binding var song: Song
    
    var body: some View {
        
        HStack {
            Text(song.songName)
                .font(.headline)
            Spacer()
            Text("\(song.plays) Plays")
                .font(.subheadline)
        }
        .contentShape(Rectangle())
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

