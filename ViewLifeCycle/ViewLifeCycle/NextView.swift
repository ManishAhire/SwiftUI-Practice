//
//  NextView.swift
//  ViewLifeCycle
//
//  Created by Manish Ahire on 16/02/26.
//

import SwiftUI

struct NextView: View {
    
    init() {
        print("NextView => init called")
    }
    var body: some View {
        Text("Hello, Next View!")
            .onAppear() {
                print("NextView => onAppear Called")
            }
            .onDisappear() {
                print("NextView => onDisappear Called")
            }
    }
}

struct NextView_Previews: PreviewProvider {
    static var previews: some View {
        NextView()
    }
}
