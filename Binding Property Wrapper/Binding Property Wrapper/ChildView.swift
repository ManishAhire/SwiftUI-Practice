//
//  ChildView.swift
//  Binding Property Wrapper
//
//  Created by Manish Ahire on 01/02/24.
//

import SwiftUI

struct ChildView: View {
    
    @Binding var name: String
    
    var body: some View {
        Text("Your Name is: \(name)")
    }
}

#Preview {
    ChildView(name: .constant("Test"))
}
