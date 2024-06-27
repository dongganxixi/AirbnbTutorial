//
//  ListingView.swift
//  AirbnbTutorial
//
//  Created by 胡瑞兴 on 2024/6/24.
//

import SwiftUI

struct ListingItemView: View {
    
    /// 在Assets文件夹里放置了需要的图片，并将名称进行对应，即可读取在此view读取
    var images = [
        "listing-1",
        "listing-2",
        "listing-3",
        "listing-4",
    ]
    var body: some View {
        VStack(spacing: 8){
            ///images
            ListingImageCarouselView()
                .frame(height: 320)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            /// listing details
            
            HStack(alignment: .top){
                // details
                VStack(alignment: .leading){
                    Text("Miami, Florida")
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                    
                    Text("12 mi away")
                        .foregroundStyle(.gray)
                    
                    Text("Nov 3 - 10")
                        .foregroundStyle(.gray)
                    
                    HStack (spacing:4){
                        Text("$567")
                            .fontWeight(.semibold)
                            .foregroundStyle(.black)
                        
                        Text("night")
                            .foregroundStyle(.black)
                    }
                    
                }
                Spacer()
                // rating
                HStack(spacing:2){
                    Image(systemName: "star.fill")
                        .foregroundStyle(.black)
                    
                    Text("4.86")
                    
                }
            }
            .font(.footnote)
        }
        .padding()
    }
}

#Preview {
    ListingItemView()
}
