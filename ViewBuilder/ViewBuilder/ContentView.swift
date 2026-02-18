//
//  ContentView.swift
//  ViewBuilder
//
//  Created by Manish Ahire on 18/02/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            getText(isPro: false)
            makeView()
        }
        .padding()
    }
}

//func makeView() -> some View {
//    Text("Hello")
//    Text("Pro User") //  ERROR
//}
 
// Working - Because @ViewBuilder combines both views and return ONE view only
@ViewBuilder
func makeView() -> some View {
    Text("Hello")
    Text("Pro User")
}

@ViewBuilder
func getText(isPro: Bool) -> some View {
    
    if isPro {
        Text("Hello")
        Text("Pro User")
    } else {
        Button("Become PRO") {
            print("Your are now PRO")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
