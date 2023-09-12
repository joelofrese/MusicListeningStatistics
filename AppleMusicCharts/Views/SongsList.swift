//
//  SongList.swift
//  AppleMusicCharts
//
//  Created by Joe Lofrese on 12/26/22.
//

import SwiftUI
import MusicKit

struct SongsList: View {
    @Binding var songs: [Song]
    var body: some View {
        List($songs) { song in
            Button(action:  {
                Task {
                    await playSong(song: song.wrappedValue)
                }
            }) {
                SongRow(song: song)
            }
            .buttonStyle(.plain)
        }
    }
}

func playSong(song: Song) async -> Void {
    if song.found {
        do {
            SystemMusicPlayer.shared.queue = MusicPlayer.Queue(for: [song.songID!])
            try await SystemMusicPlayer.shared.play()
        }
        catch {
            print("Failed to play song.")
        }
    }
}

//struct SongList_Previews: PreviewProvider {
//    static var previews: some View {
//        SongList()
//    }
//}
