//
//  CircleImage.swift
//  AppleMusicCharts
//
//  Created by Joe Lofrese on 1/11/22.
//

import SwiftUI

struct CircleImage: View {
    var image: UIImage
    var body: some View {
        Image(uiImage: image)
            .resizable()
            .padding(.all, 1.3)
            .frame(width: 50, height: 50)
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 3)
            }
            .shadow(radius: 3)
    }
}

//struct CircleImage_Previews: PreviewProvider {
//    static var previews: some View {
//        CircleImage(genre: "Pop")
//    }
//}

func genreToImage(genre: String) -> String {
    
    switch genre {
        case "Alternative", "Country", "Electronic", "Jazz", "Pop", "Rap", "Rock":
            return genre
        case "Indie":
            return "Alternative"
        case "Dance":
            return "Electronic"
        case "Hip Hop/Rap":
            return "Rap"
        default:
            return "Default"
    }
}
