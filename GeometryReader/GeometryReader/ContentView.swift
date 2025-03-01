//
//  ContentView.swift
//  GeometryReader
//
//  Created by Manish on 28/02/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack {
            
            // Basic Use
            GeometryReader { geometry in
                VStack {
                    Text("Width: \(geometry.size.width)")
                    Text("Height: \(geometry.size.height)")
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
                .background(.blue)
            }
            
            // Center the view
            GeometryReader { geometry in
                Text("Hello, Geometry")
                    .frame(width: 100, height: 100)
                    .background(.red)
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
            }
            
            // Responsive UI
            GeometryReader { geometry in
                
                HStack {
                    Text("Left")
                        .frame(width: geometry.size.width * 0.3)
                        .background(.green)
                    
                    Text("Right")
                        .frame(width: geometry.size.width * 0.7)
                        .background(.pink)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
