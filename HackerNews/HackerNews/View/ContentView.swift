//
//  ContentView.swift
//  HackerNews
//
//  Created by Manish Ahire on 15/01/26.
//

import SwiftUI

struct ContentView: View {
   
   @StateObject private var vm = NewsViewModel()
    
    var body: some View {
        
        NavigationStack {
            
            Group {
                if vm.isLoading {
                    ProgressView("Loading...")
                } else if let error = vm.error {
                    Label("Error: \(error.localizedDescription)", systemImage: "wifi.slash")
                } else {
                    List(vm.posts) { post in
                        NavigationLink(destination: DetailView(url: .constant(post.url))) {
                            HStack {
                                Text("\(post.points)")
                                    .foregroundStyle(.secondary)
                                    .monospacedDigit()
                                Text(post.title)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Hacker News")
        }
        .task {
            await vm.load()
        }
        .refreshable {
            await vm.load()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
