//
//  WebView.swift
//  ShanmugaPriya-SwiftUI-Project
//
//  Created by Shanmuga Priya M on 18/10/23.
//

import Foundation
import UIKit
import SwiftUI
import WebKit

struct WebView:UIViewRepresentable{
    var url:URL
    func updateUIView(_ uiView: UIViewType, context: Context) {
        let webRequest = URLRequest(url:url)
        (uiView as! WKWebView).load(webRequest)
    }
    func makeUIView(context: Context) -> some UIView {
        return WKWebView()
    }
    
}
