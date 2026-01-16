//
//  DetailView.swift
//  HackerNews
//
//  Created by Manish Ahire on 16/01/26.
//

import SwiftUI

struct DetailView: View {
    
    @Binding var url: String?
    
    var body: some View {
        WebView(strURL: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: .constant("https:/manishahire.com"))
    }
}

