//
//  ParentView.swift
//  Binding Property Wrapper
//
//  Created by Manish Ahire on 01/02/24.
//

import SwiftUI

struct ParentView: View {
    
    @State var userName: String = String()
    var body: some View {
       
        VStack {
            
            TextField("Enter your Name", text: $userName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            ChildView(name: $userName)
        }
        .padding()
       
    }
}

#Preview {
    ParentView()
}
