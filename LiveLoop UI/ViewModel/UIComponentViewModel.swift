//
//  UIComponentViewModel.swift
//  LiveLoop UI
//
//  Created by Bilal Akram on 9/16/25.
//

import Foundation
import Combine

class UIComponentViewModel: ObservableObject {
    
    @Published var uicomponents: [UIComponent] = []  // Store components
    @Published var errormessage: String?

    // Fetch data (simulated)
    func fetchData() {
        print("Fetching data...")

        
        let jsonData = """
        [
            {
                "id": "1",
                "type": "text",
                "content": "Welcome to Server-Driven UI!"
            },
            {
                "id": "2",
                "type": "button",
                "content": "Click Me"
            },
            {
                "id": "4",
                "type": "carousel",
                "images": ["https://image-processor-storage.s3.us-west-2.amazonaws.com/images/3cf61c1011912a2173ea4dfa260f1108/halo-of-neon-ring-illuminated-in-the-stunning-landscape-of-yosemite.jpg", "https://img.freepik.com/free-photo/woman-beach-with-her-baby-enjoying-sunset_52683-144131.jpg?size=626&ext=jpg" ]
            },
            {
                "id": "5",
                "type": "card",
                "title": "Amazing Product",
                "subtitle": "The best product you'll ever use",
                "imageUrl": "https://media.istockphoto.com/id/814423752/photo/eye-of-model-with-colorful-art-make-up-close-up.jpg?s=612x612&w=0&k=20&c=l15OdMWjgCKycMMShP8UK94ELVlEGvt7GmB_esHWPYE="
            },
            {
                "id": "3",
                "type": "image",
                "content": "A cool image",
                "imageUrl": "https://image-processor-storage.s3.us-west-2.amazonaws.com/images/3cf61c1011912a2173ea4dfa260f1108/halo-of-neon-ring-illuminated-in-the-stunning-landscape-of-yosemite.jpg"
            },
            {
                "id": "6",
                "type": "action_button",
                "content": "Buy Now",
                "icon": "cart"
            },
            {
                "id": "7",
                "type": "promo",
                "content": "Special Offer!",
                "imageUrl": "https://media.istockphoto.com/id/814423752/photo/eye-of-model-with-colorful-art-make-up-close-up.jpg?s=612x612&w=0&k=20&c=l15OdMWjgCKycMMShP8UK94ELVlEGvt7GmB_esHWPYE=",
                "title": "Limited Time Offer",
                "subtitle": "Get 30% off your next purchase"
            }
        ]
        """.data(using: .utf8)!

        let decoder = JSONDecoder()
        do {
            let components = try decoder.decode([UIComponent].self, from: jsonData)
            self.uicomponents = components
            print("Data fetched successfully: \(components)")  // Print the decoded data
        } catch {
            self.errormessage = "Failed to decode JSON: \(error.localizedDescription)"
            print("Failed to decode JSON: \(error.localizedDescription)")  // Print the error
        }
    }
}
