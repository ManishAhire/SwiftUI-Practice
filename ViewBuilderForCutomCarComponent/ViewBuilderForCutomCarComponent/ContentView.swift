//
//  ContentView.swift
//  ViewBuilderForCutomCarComponent
//
//  Created by Manish Ahire on 18/02/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("@ViewBuilder - Custom Card Component")
                .font(.headline)
            
            Card {
                Text("Card - Title")
                    .font(.headline)

                Text("Card - Description")
                    .font(.subheadline)
                
                Button("Tap Me") {
                    print("OK")
                }
                .padding(.top)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
