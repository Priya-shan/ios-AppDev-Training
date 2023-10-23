//
//  TextView.swift
//  ShanmugaPriya-SwiftUI-Project
//
//  Created by Shanmuga Priya M on 18/10/23.
//

import Foundation
import UIKit
import SwiftUI
struct TextView: UIViewRepresentable{
    func makeCoordinator() -> Coordinator {
        Coordinator($text)
    }
    
    @Binding var text:String
    @Binding var textStyle:UIFont.TextStyle
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        (uiView as! UITextView).text = text
        (uiView as! UITextView).font = UIFont.preferredFont(forTextStyle: textStyle)
    }
    
    
    func makeUIView(context : Context)-> some UIView{
        let textView = UITextView()
        textView.font=UIFont.preferredFont(forTextStyle: textStyle)
        return textView
    }
    
    class Coordinator: NSObject,UIWebViewDelegate{
        var text: Binding<String>
        init(_ text:Binding<String>){
            self.text = text
        }
        
        func textViewDidChange(_ textView:UITextView){
            self.text.wrappedValue = textView.text
        }
    }
}
