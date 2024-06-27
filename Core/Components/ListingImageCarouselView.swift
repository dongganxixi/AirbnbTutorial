//
//  ListingImageCarouselView.swift
//  AirbnbTutorial
//
//  Created by 胡瑞兴 on 2024/6/25.
//

import SwiftUI

struct ListingImageCarouselView: View {
    var images = [
        "listing-1",
        "listing-2",
        "listing-3",
        "listing-4",
    ]
    var body: some View {
        ///images
        TabView(content: {
            ForEach(images, id: \.self) { image in
                Image(image)
                    .resizable()
                    .scaledToFill()
            }
        })
        .tabViewStyle(.page)
    }
}

#Preview {
    ListingImageCarouselView()
}
