//
//  LandmarkDetails.swift
//  Landmark
//
//  Created by Manish on 19/01/24.
//

import SwiftUI

struct LandmarkDetails: View {
    var body: some View {
        VStack {
            
            MapView()
                .frame(height: 300)
            
            CircleImage()
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                
                Text("Pune")
                    .font(.title)
                
                HStack {
                    Text("Maharastra, India.")
                    Spacer()
                    Text("412101")
                }.font(.subheadline)
                    .foregroundStyle(.secondary)
                
                Divider()
                
                Text("About the Pune")
                    .font(.title2)
                
                Text("Descriptive text goes here.")
            }
            .padding()
            
            Spacer()
        }
    }
}

#Preview {
    LandmarkDetails()
}
