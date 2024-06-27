//
//  DestinationSearchView.swift
//  AirbnbTutorial
//
//  Created by 胡瑞兴 on 2024/6/25.
//

import SwiftUI

/// 设置选择的模块enum
enum DestinationSearchOptions{
    case location
    case dates
    case guests
}

struct DestinationSearchView: View {
    /// _@note @Binding 将绑定一个链接值，在哪些新的调用它的视图中，选择对应调用视图中的对应属性参数。
    @Binding var show: Bool
    @State private var destination = ""
    
    /** _@warning:  设置三个选项被选择的状态: 但这种方式导致需要频繁设置某一个状态的true 或者 false。
     -  @State private var locationSelected = false
     -  @State private var datesSelected = false
     -  @State private var guestsSelected = false
     */
    ///  初始化时给定位到 location 视图
    @State private var selectedOption: DestinationSearchOptions = .location
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var numGuests = 0
    
    var body: some View {
        VStack {
            Button(action: {
                withAnimation(.snappy){
                    show.toggle()
                }
                
            }, label: {
                Image(systemName: "xmark.circle")
                    .imageScale(.large)
                    .foregroundStyle(.black)
                
            })
            /// DestinationSearchBar
            VStack(alignment: .leading){
                if selectedOption == .location{
                    Text("Where to?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .imageScale(.small)
                        
                        TextField("Search destinations", text: $destination)
                            .font(.subheadline)
                    }
                    .frame(height: 44)
                    .padding(.horizontal)
                    .overlay{
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(lineWidth: 1.0)
                        /***
                         _@warning:  swift UI 中的 .foregroundStyle(Color.gray)
                         使用color.gray 是使用swift UI的颜色，color（.systemgray4）是UIKIT的颜色，后者
                         丰富性更强，但优先使用前者：如果你主要使用 SwiftUI 开发，并且不需要特别的 UIKit 系统颜色，优先使用 SwiftUI 提供的颜色
                         */
                            .foregroundStyle(Color(.systemGray4))
                    }
                }else{
                    /// _@note: 当选中焦点不在此处时，将其缩放成 “ 窄条” 的收缩状态
                    CollapsedPickerView(title: "Where", description: "Add destination")
                }
                
                
            }
            .modifier(CollapsedpickerModifierView())
            .frame(height: selectedOption == .location ? 120 : 64)
            .onTapGesture {
                withAnimation(.snappy){selectedOption = .location}
            }
            ///_@note 增加阴影效果后，再加上前面的白色背景色，就出现了悬浮阴影的效果
        
            
            /// data selection view
            VStack(alignment: .leading){
                if selectedOption == .dates{
                   Text("when's your trip?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    VStack{
                        DatePicker("From", selection: $startDate, displayedComponents: .date)
                        
                        Divider()
                        
                        DatePicker("To", selection: $endDate, displayedComponents: .date)
                    }
                    .foregroundStyle(.gray)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
            } else {
                    CollapsedPickerView(title: "When", description: "Add dates")
                }
            }
            .modifier(CollapsedpickerModifierView())
            .frame(height: selectedOption == .dates ? 180 : 64)
            .onTapGesture {
                withAnimation(.snappy){ selectedOption = .dates }
            }
            
            /// num guests view
            VStack(alignment: . leading){
                if selectedOption == .guests{
                   Text("Who's coming?")
                        .font(.title)
                        .fontWeight(.semibold)
                    
                    Stepper{
                        Text("\(numGuests) Adults ")
                    } onIncrement: {
                        numGuests += 1
                    } onDecrement: {
                        numGuests -= 1
                    }
                }else{
                    CollapsedPickerView(title: "Who", description: "Add guests")
                }
            }
            .modifier(CollapsedpickerModifierView())
            .frame(height: selectedOption == .guests ? 120 : 64)
            .onTapGesture {
                withAnimation(.snappy){selectedOption = .guests}
            }
        }
    }
}


#Preview {
    /// .constant( ) 是一个返回binding值的设置
    DestinationSearchView(show: .constant(false))
}
/// 将重复的modifier 设置成单独的 struct ,使结构清晰明了
struct CollapsedpickerModifierView : ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
    }
   
}
struct CollapsedPickerView: View {
    let title: String
    let description: String
    
    var body: some View {
        VStack{
            HStack{
                Text(title)
                    .foregroundStyle(.gray)
                Spacer()
                Text(description)
            }
            .fontWeight(.semibold)
            .font(.subheadline)
        }
    }
}
