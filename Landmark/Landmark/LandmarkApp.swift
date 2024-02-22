//
//  LandmarkApp.swift
//  Landmark
//
//  Created by Manish on 18/01/24.
//

import SwiftUI

@main
struct LandmarkApp: App {
    
    @State private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            LandmarkList()
                .environment(modelData)
        }
    }
}
