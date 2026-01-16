//
//  ContentView.swift
//  HackerNews
//
//  Created by Manish Ahire on 15/01/26.
//

import SwiftUI

struct ContentView: View {
   
    @State private var posts: [Post] = []
    
    var body: some View {
        
        NavigationStack {
            
            
            List(posts) { post in
                NavigationLink(destination: DetailView(url: .constant(post.url))) {
                    HStack {
                        Text("\(post.points)")
                        Text(post.title)
                    }
                }
               
            }
            .navigationTitle("Hacker News")
        }
        .task {
            
            do {
                posts = try await HTTPUtility.shared.fetchAllNews()
                print(posts)
            } catch (let error) {
                print(error)
            }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
