//
//  ImageBannerComponent.swift
//  LiveLoop UI
//
//  Created by Bilal Akram on 9/17/25.
//

import SwiftUI

struct ImageBannerData: Decodable {
    let image: String
}

struct ImageBannerComponent: View {
    let data: ImageBannerData
    
    var body: some View {
        Image(data.image)
            .resizable()
            .frame(width: 320, height: 120)
            .cornerRadius(20)
            .aspectRatio(contentMode: .fit)
    }
}
