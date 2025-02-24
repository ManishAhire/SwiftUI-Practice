//
//  SwiftUIView.swift
//  SwiftUIIntoUIKit
//
//  Created by Manish on 23/01/25.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        VStack {
            Text("Hello from SwiftUI!")
                .fontWeight(.bold)
                .foregroundStyle(.red)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.green)
    }
}

#Preview {
    SwiftUIView()
}
