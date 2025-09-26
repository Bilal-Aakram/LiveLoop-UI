//
//  UIComponent.swift
//  LiveLoop UI
//
//  Created by Bilal Akram on 9/16/25.
//


import Foundation

struct UIComponent: Identifiable, Decodable {
    let id: String
    let type: String
    let content: String?
    let imageUrl: String? // Optional for images
    let images: [String]? // Optional for carousel images
    let title: String? // Optional for card component and promo
    let subtitle: String? // Optional for card component and promo
    let icon: String? // Optional for ActionButton component
    
    enum CodingKeys: String, CodingKey {
        case id, type, content, imageUrl, images, title, subtitle, icon
    }
}
