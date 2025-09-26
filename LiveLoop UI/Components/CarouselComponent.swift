//
//  CarouselComponent.swift
//  LiveLoop UI
//
//  Created by Bilal Akram on 9/17/25.
//

import SwiftUI

struct CarouselComponent: View {
    let images: [String]  // Array of image URLs

    var body: some View {
        TabView {
            // Loop through each image in the array
            ForEach(images, id: \.self) { image in
                if let url = URL(string: image) {
                    AsyncImage(url: url) { image in
                        image.resizable()
                             .scaledToFit()
                             .frame(width: 300, height: 200)
                             .cornerRadius(10)
                    } placeholder: {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                    }
                    .onAppear {
                        print("Loading image: \(image)")
                    }
                } else {
                
                    Text("Invalid Image URL")
                        .foregroundColor(.red)
                        .frame(width: 300, height: 200)
                }
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        .frame(height: 200)  
    }
}



#Preview {
    CarouselComponent(images: ["https://image-processor-storage.s3.us-west-2.amazonaws.com/images/3cf61c1011912a2173ea4dfa260f1108/halo-of-neon-ring-illuminated-in-the-stunning-landscape-of-yosemite.jpg", "https://img.freepik.com/free-photo/woman-beach-with-her-baby-enjoying-sunset_52683-144131.jpg?size=626&ext=jpg" ])
}
