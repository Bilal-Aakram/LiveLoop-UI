//
//  ContentView.swift
//  LiveLoop UI
//
//  Created by Bilal Akram on 9/16/25.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = UIComponentViewModel()

    var body: some View {
        ScrollView {
            VStack {
                // Iterate over all components in the view model
                ForEach(viewModel.uicomponents, id: \.id) { component in
                    switch component.type {
                    case "text":
                        if let content = component.content {
                            Text(content)  // Display text
                                .padding()
                        }
                    case "button":
                        if let content = component.content {
                            Button(action: {
                                print("Button tapped: \(content)")
                            }) {
                                Text(content)  // Display button
                                    .padding()
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                            }
                        }
                    case "image":
                        if let imageUrl = component.imageUrl {
                            AsyncImage(url: URL(string: imageUrl)) { image in
                                image.resizable()
                                     .scaledToFit()
                                     .frame(width: 300, height: 200)
                                     .cornerRadius(10)
                            } placeholder: {
                                ProgressView()  // Placeholder while the image is loading
                            }
                            .padding()
                        }
                    case "carousel":
                        if let images = component.images {
                            CarouselComponent(images: images)  // Display carousel
                        }
                    case "card":
                        if let title = component.title,
                           let subtitle = component.subtitle,
                           let imageUrl = component.imageUrl {
                            CardComponent(title: title, subtitle: subtitle, imageUrl: imageUrl)  // Display card
                        }
                    case "action_button":
                        if let title = component.content, let icon = component.icon {
                            ActionButtonComponent(title: title, icon: icon, action: {
                                print("\(title) button tapped!")
                            })
                        }
                    case "promo":
                        if let title = component.title,
                           let subtitle = component.subtitle,
                           let imageUrl = component.imageUrl {
                            PromoBannerComponent(title: title, subtitle: subtitle, actionTitle: "Shop Now", imageUrl: imageUrl, action: {
                                print("Promo action tapped!")
                            })
                        }
                    default:
                        EmptyView()  // For unknown types
                    }
                }
            }
        }
        .onAppear {
            viewModel.fetchData()  // Fetch data when the view appears
        }
    }
}
