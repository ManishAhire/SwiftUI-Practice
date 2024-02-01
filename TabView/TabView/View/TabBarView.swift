//
//  TabBarView.swift
//  TabView
//
//  Created by Manish Ahire on 01/02/24.
//

import SwiftUI

struct TabBarView: View {
    
    @State var defaultView : Int = 2
    
    var body: some View {
        
        TabView(selection: $defaultView) {
            
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
                .tag(0)
            
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
                .tag(1)
            
            PlayView()
                .tabItem {
                    Image(systemName: "play")
                    Text("Play")
                }
                .tag(2)
            
            NotesView()
                .tabItem {
                    Image(systemName: "pencil")
                    Text("Notes")
                }
                .tag(3)
            
            MessageView()
                .tabItem {
                    Image(systemName: "message")
                    Text("Message")
                }
                .tag(4)
            
            MessageView()
                .tabItem {
                    Image(systemName: "message")
                    Text("Message")
                }
                .tag(5)
            
            MessageView()
                .tabItem {
                    Image(systemName: "message")
                    Text("Message")
                }
                .tag(6)
        }
        .tint(.red)
    }
}

#Preview {
    TabBarView()
}
