//
//  CustomButton.swift
//  ShanmugaPriya-SwiftUI-Project
//
//  Created by Shanmuga Priya M on 16/10/23.
//

import SwiftUI

struct CustomButton: View {
    var action: () -> Void
    @State var buttonName:String
    @State var buttonWidth:Int
    var body: some View {
        Button(action: action) {
            Text(buttonName)
                .padding(10)
                .foregroundColor(.black)
                .frame(width: CGFloat(buttonWidth))
                .background(Color("PrimaryColor"))
                .cornerRadius(10)
                
        }
    }
}

//#Preview {
//    CustomButton()
//}
