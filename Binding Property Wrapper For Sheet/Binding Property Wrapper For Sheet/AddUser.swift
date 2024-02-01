//
//  AddUser.swift
//  Binding Property Wrapper For Sheet
//
//  Created by Manish Ahire on 01/02/24.
//

import SwiftUI

struct AddUser: View {
    
    @Binding var isPresented: Bool
    
    var body: some View {
       
        VStack {
            
            Button("Hide View") {
                
                isPresented.toggle()
                
            }
        }
    }
}

#Preview {
    AddUser(isPresented: .constant(false))
}
