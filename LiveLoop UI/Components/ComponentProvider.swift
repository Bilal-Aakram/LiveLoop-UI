//
//  ComponentProvider.swift
//  LiveLoop UI
//
//  Created by Bilal Akram on 9/17/25.
//

import SwiftUI

enum ComponentProvider: Identifiable, View {
    case imageBanner(data: ImageBannerData)
    case carousel(images: [String])
    case card(title: String, subtitle: String, imageUrl: String)
    case actionButton(title: String, icon: String, action: () -> Void)
    case promo(title: String, subtitle: String, actionTitle: String, imageUrl: String, action: () -> Void)

    var id: String { return UUID().uuidString }

    @ViewBuilder
    var body: some View {
        switch self {
        case .imageBanner(let data):
            ImageBannerComponent(data: data)
        case .carousel(let images):
            CarouselComponent(images: images)
        case .card(let title, let subtitle, let imageUrl):
            CardComponent(title: title, subtitle: subtitle, imageUrl: imageUrl)
        case .actionButton(let title, let icon, let action):
            ActionButtonComponent(title: title, icon: icon, action: action)
        case .promo(let title, let subtitle, let actionTitle, let imageUrl, let action):
            PromoBannerComponent(title: title, subtitle: subtitle, actionTitle: actionTitle, imageUrl: imageUrl, action: action)
        }
    }
}
