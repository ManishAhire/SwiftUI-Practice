//
//  ContentView.swift
//  ViewLifeCycle
//
//  Created by Manish Ahire on 16/02/26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var counter = 0
    @Environment(\.scenePhase) var phase
    
    init() {
        print("HomeView => Init Called")
    }
    
    var body: some View {
        
        NavigationStack {
            VStack {
                
                Text("Hello, I'm Home View!")
                
                VStack {
                    Text("Your counter: \(counter)")
                    
                    Button("Increase Counter") {
                        counter += 1
                    }
                    .padding()
                    .fontWeight(.heavy)
                }
                .padding()
                .border(.blue, width: 2)

                
                NavigationLink("Next View") {
                    NextView()
                }
                .padding()
            }
            .padding()
            .onAppear() {
                print("HomeView => onAppear Called")
            }
            .onDisappear() {
                print("HomeView => onDisappear Called")
            }
            .onChange(of: phase) { newPhase in
                switch newPhase {
                case .inactive:
                    print("Inactive State")
                case .active:
                    print("Active State")
                case .background:
                    print("Background State")
                default:
                    print("Different State")
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
