//
//  ActionButtonComponent.swift
//  LiveLoop UI
//
//  Created by Bilal Akram on 9/17/25.
//

import SwiftUI

struct ActionButtonComponent: View {
    let title: String
    let icon: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: icon)
                Text(title) 
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
    }
}
