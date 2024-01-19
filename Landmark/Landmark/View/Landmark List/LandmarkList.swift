//
//  LandmarkList.swift
//  Landmark
//
//  Created by Manish on 19/01/24.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        
        List(landmarks) { landmark in
            
            LandmarkRow(landmark: landmark)
            
        }
    }
}

#Preview {
    LandmarkList()
}
