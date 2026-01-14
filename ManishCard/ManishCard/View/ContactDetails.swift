//
//  ContactDetails.swift
//  ManishCard
//
//  Created by Manish Ahire on 14/01/26.
//

import SwiftUI

struct ContactDetails: View {
    
    let image: String
    let text: String
    
    var body: some View {
        
        RoundedRectangle(cornerRadius: 25)
            .frame(height: 50)
            .foregroundColor(.white)
            .overlay(
                HStack {
                    Image(systemName: image)
                        .foregroundColor(.green)
                    
                    Text(text)
                        .foregroundColor(.black)
                }
            )
            .padding()
    }
}

struct ContactDetails_Previews: PreviewProvider {
    static var previews: some View {
        ContactDetails(image: "phone.fill", text: "Hello")
            .previewLayout(.sizeThatFits)
        
    }
}
