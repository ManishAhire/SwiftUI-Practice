//
//  LandmarkList.swift
//  Landmark
//
//  Created by Manish on 19/01/24.
//

import SwiftUI

struct LandmarkList: View {
    
    @Environment(ModelData.self) var modelData
    
    @State private var showFavoriteOnly = false
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            
            (!showFavoriteOnly || landmark.isFavorite)
            
        }
    }
    
    var body: some View {
        
        NavigationSplitView {
            
            List {
                
                Toggle(isOn: $showFavoriteOnly) {
                    Text("Favorites Only")
                }
                       
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetails(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
                
            }
            .animation(.default, value: filteredLandmarks)
            .navigationTitle("Landmarks")
        } detail: {
            Text("Select a Landmark")
        }
       
    }
}

#Preview {
    LandmarkList()
        .environment(ModelData())
}
