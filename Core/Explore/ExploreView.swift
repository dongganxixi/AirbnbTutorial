/**
    浏览的主界面
 
 */
//  Created by 胡瑞兴 on 2024/6/23.
//

import SwiftUI

struct ExploreView: View {
    /// 设置是否显示到search view 的变量
    @State private var showDestinaitonSearchView = false
    
    var body: some View {
        NavigationStack{
            if showDestinaitonSearchView {
                DestinationSearchView(show: $showDestinaitonSearchView)
            }else{
                ScrollView{
                    SearchAndFilterBar()
                    /// onTapGesture ： SwiftUI 中处理点击事件的便捷方式，可用与任何视图，响应点击操作。
                        .onTapGesture {
                            withAnimation (.snappy){
                                /// toggle()方法是 “ Bool ” 类型的方法，用于在 true 与 false 的当前状态切换。
                                showDestinaitonSearchView.toggle()
                            }
                        }
                    
                    LazyVStack(spacing:32, content: {
                        ForEach(1...10, id: \.self) { listing in
                            NavigationLink(value: listing) {
                                ListingItemView()
                                    .frame(height: 400)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                            
                        }
                    })
                }
                .navigationDestination(for: Int.self) { listing in
                    ListingDetailView()
                        .navigationBarBackButtonHidden()
                }
            }
        }
    }
}

#Preview {
    ExploreView()
}
