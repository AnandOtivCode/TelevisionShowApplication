//
//  WebView.swift
//  TelevisionShowApplication
//
//  Created by Anand Otiv on 2025-03-29.
//
// Used for opening web pages

import WebKit
import SwiftUI

struct WebView: UIViewRepresentable{
    let webText: String?
    func makeUIView(context: Context) -> WKWebView {
        WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let text = webText, let url = URL(string: text) else {
            return
        }
        
        let urlRequest = URLRequest(url: url)
        uiView.load(urlRequest)
    }
    
    typealias UIViewType = WKWebView
    
    
}
