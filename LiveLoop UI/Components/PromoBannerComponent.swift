//
//  PromoBannerComponent.swift
//  LiveLoop UI
//
//  Created by Bilal Akram on 9/17/25.
//

import SwiftUI

struct PromoBannerComponent: View {
    let title: String
    let subtitle: String
    let actionTitle: String
    let imageUrl: String
    let action: () -> Void

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                Text(subtitle)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Button(action: action) {
                    Text(actionTitle)
                        .font(.body)
                        .foregroundColor(.blue)
                }
            }
            Spacer()
            AsyncImage(url: URL(string: imageUrl)) { image in
                image.resizable()
                     .scaledToFit()
                     .frame(width: 100, height: 100)
                     .cornerRadius(8)
            } placeholder: {
                ProgressView()
            }
        }
        .padding()
        .background(Color.yellow.opacity(0.1))
        .cornerRadius(10)
        .padding()
    }
}

