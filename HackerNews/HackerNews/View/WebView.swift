//
//  WebView.swift
//  HackerNews
//
//  Created by Manish Ahire on 16/01/26.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    
    let strURL: String?
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let strURL = strURL, let url = URL(string: strURL) {
            uiView.load(URLRequest(url: url))
        }
    }
}
