//
//  CardView.swift
//  ViewBuilderForCutomCarComponent
//
//  Created by Manish Ahire on 18/02/26.
//

import SwiftUI

struct Card<T: View>: View {
    
    private let content: T
    
    init(@ViewBuilder content: () -> T) {
        self.content = content()
    }
    
    var body: some View {
        VStack {
            content
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 5)
    }
}
