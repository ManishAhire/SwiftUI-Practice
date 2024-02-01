//
//  HomeView.swift
//  TabView
//
//  Created by Manish Ahire on 01/02/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        
        NavigationView {
            NavigationLink("Navigate") {
                HomeNaivgateView()
            }
        }
      
    }
}

#Preview {
    HomeView()
}
