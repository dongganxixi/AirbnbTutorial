import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Text("First View")
                .tabItem {
                    Image(systemName: "1.square.fill")
                    Text("First")
                }
            
            Text("Second View")
                .tabItem {
                    Image(systemName: "2.square.fill")
                    Text("Second")
                }
            
            Text("Third View")
                .tabItem {
                    Image(systemName: "3.square.fill")
                    Text("Third")
                }
        }
    }
}
