//
//  CardComponent.swift
//  LiveLoop UI
//
//  Created by Bilal Akram on 9/17/25.
//

import SwiftUI

struct CardComponent: View {
    let title: String
    let subtitle: String
    let imageUrl: String

    var body: some View {
        VStack {
            Image(imageUrl)
                .resizable()
                .scaledToFit()
                .frame(height: 150)
                .cornerRadius(10)

            Text(title)
                .font(.headline)
                .padding(.top, 5)

            Text(subtitle)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 5)
    }
}
