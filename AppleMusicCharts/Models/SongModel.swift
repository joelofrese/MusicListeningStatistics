//
//  SongModel.swift
//  AppleMusicCharts
//
//  Created by Joe Lofrese on 12/22/22.
//

import SwiftUI
import Foundation

struct SongName: Codable {
    let songs: SongData
    
    struct SongData: Codable {
        let data: Data
        
        struct Data: Codable {
            let id: String
        }
    }
}
