//
//  ArtistDetail.swift
//  AppleMusicCharts
//
//  Created by Joe Lofrese on 1/13/22.
//

import SwiftUI

struct ArtistDetail: View {
    @Binding var artist: Artist
    
    var body: some View {
        SongsList(songs: $artist.songs)
    }
}

//struct ArtistDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        ArtistDetail()
//    }
//}
