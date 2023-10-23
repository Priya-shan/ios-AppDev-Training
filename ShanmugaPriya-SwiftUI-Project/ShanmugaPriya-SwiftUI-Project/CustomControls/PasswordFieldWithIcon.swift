//
//  PasswordFieldWithIconView.swift
//  ShanmugaPriya-SwiftUI-Project
//
//  Created by Shanmuga Priya M on 16/10/23.
//

import SwiftUI

struct PasswordFieldWithIcon: View {
    @State var isPasswordVisible:Bool
    @Binding var value:String
    @State var placeholder:String
    var body: some View {
        VStack{
            if isPasswordVisible {
                TextField(placeholder, text: $value)
            } else {
                SecureField(placeholder, text: $value)
            }
        }
        .padding(10)
        .padding(.leading, 25)
        .background(RoundedRectangle(cornerRadius: 15).stroke())
        .overlay(
            HStack {
                Image(systemName: "lock")
                    .foregroundColor(.gray)
                    .padding(.leading, 10)
                Spacer()
                Image( systemName: isPasswordVisible ? "eye" : "eye.slash")
                    .foregroundColor(.gray)
                    .padding(.trailing, 10)
                    .onTapGesture {
                        isPasswordVisible.toggle()
                    }
            })
        
    }
}

#Preview {
    PasswordFieldWithIcon(isPasswordVisible: false, value: .constant(""),placeholder: "Password")
}
