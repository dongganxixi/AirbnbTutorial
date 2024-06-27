//
//  ListingDetailView.swift
//  AirbnbTutorial
//
//  Created by 胡瑞兴 on 2024/6/25.
//

import SwiftUI
import MapKit

struct ListingDetailView: View {
    var images = [
        "listing-1",
        "listing-2",
        "listing-3",
        "listing-4",
    ]
    /// 增加一个返回按钮
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView{
            /// put the images view to  a zstack to get a backbutton
            ZStack(alignment: .topLeading) {
                /// images in the top view
                ListingImageCarouselView()
                    .frame(height: 320)
                
                Button{
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.black)
                    ///  in the background modifier, you can add lots of components
                        .background{
                            Circle()
                                .fill(.white)
                                .frame(width: 32, height: 32)
                        }
                        .padding(32)
                    // MARK: 由于 ignore the safe area ，返回按钮看不见，在label里面增加padding（）
                }
//                .padding(32)
              ///** .padding(32) 加在这为什么不行，暂时还没搞明白，后续再研究 **
            }
            
            /// stars and reviews
            VStack(alignment: .leading, spacing: 8, content: {
                Text("Miami Villa")
                    .font(.title)
                    .fontWeight(.semibold)
                VStack(alignment: .leading){
                    HStack(spacing: 2){
                        Image(systemName: "star.fill")
                        
                        Text("4.86")
                        
                        Text(" - ")
                        
                        Text("28 reviews")
                            .underline()
                            .fontWeight(.semibold)
                    }
                    .font(.caption)
                    .foregroundStyle(.black)
                    
                    Text("Miami, Florida")
                }
                .font(.caption)
            })
            .padding(.leading)
            //** 这是一种常用的方式，让需要的文字放置到框架的最前端 **
            .frame(maxWidth: .infinity, alignment: .leading)
            
            /// 添加分割线：默认情况下是灰色的浅色线
            Divider()
                .padding(.horizontal, 10)
            
            /// host info view
            HStack{
                VStack(alignment: .leading, spacing: 4){
                    Text("Entire villa hosted by John Smith")
                        .font(.headline)
                        .frame(width: 250,alignment: .leading)
                    
                    HStack{
                        Text("4 guests -")
                        Text("4 bedrooms -")
                        Text("4 beds -")
                        Text("3 baths")
                    }
                    .font(.caption)
                }
                .frame(width: 300,alignment: .leading)
                
                Spacer()
                
                Image("people1")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 64, height: 64)
                    .clipShape(Circle())
            }
            .padding()
            
            Divider()
                .padding(.horizontal, 10)
            
            /// listing features
            VStack(alignment: .leading, spacing: 16){
                ForEach(0 ..< 2){feature in
                    HStack(spacing: 12){
                        Image(systemName: "medal")
                        
                        VStack(alignment: .leading){
                            Text("Superhost")
                                .font(.footnote)
                                .fontWeight(.semibold)
                            
                            Text("Superhosts are experience, highly rated hosts who are commited to providing great stars for guests")
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                        /// 让整体向左移动
                        Spacer()
                    }
                }
            }
            .padding()
            
            Divider()
                .padding(.horizontal, 10)
            
            /// bedrooms view
            VStack(alignment: .leading,spacing: 16){
                Text("Where you'll sleep")
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 16){
                        ForEach(0 ..< 5){bedroom in
                            VStack {
                                Image(systemName: "bed.double")
                                Text("Bedroom \(bedroom)")
                            }
                            .frame(width: 132, height: 100)
                            .overlay {
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(lineWidth: 1)
                                    .foregroundStyle(.gray)
                            }
                        }
                    }
                }
                /// 分页滚动效果： iOS 17 的新特效
                .scrollTargetBehavior(.paging)
            }
            .padding()
            
            Divider()
                .padding(.horizontal, 10)
            
            /// listing amenities
            VStack(alignment: .leading, spacing: 16){
                Text("What this place offers")
                    .font(.headline)
                ForEach(0 ..< 5) { feature in
                    HStack{
                        Image(systemName: "wifi")
                            .frame(width: 32)
                        Text("Wifi")
                            .font(.footnote)
                        Spacer()
                    }
                }
            }
            .padding()
            
            Divider()
                .padding(.horizontal, 10)
            
            VStack(alignment: .leading, spacing: 16){
                Text("Where you'll be")
                    .font(.headline)
                Map()
                    .frame(height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            .padding()
        }
        .ignoresSafeArea()
        .padding(.bottom, 64)
        /// 视图底部的预定界面
        .overlay(alignment: .bottom) {
            VStack{
                Divider()
                    .padding(.bottom)
                
                HStack{
                    VStack{
                        Text("$500")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        
                        Text("Total before taxes")
                            .font(.footnote)
                        
                        Text("Oct 15 - 20")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .underline()
                    }
                    Spacer()
                    
                    Button(action: {}, label: {
                        Text("Reserve")
                            .foregroundStyle(.white)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 140, height: 40)
                            .background(.pink)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    })
                }
                .padding(.horizontal)
            }
            .background(.white)
        }
    }
}

#Preview {
    ListingDetailView()
}
