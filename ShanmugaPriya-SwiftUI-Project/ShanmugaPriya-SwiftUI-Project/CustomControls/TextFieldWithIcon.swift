//
//  TextFieldWithIcon.swift
//  ShanmugaPriya-SwiftUI-Project
//
//  Created by Shanmuga Priya M on 16/10/23.
//

import SwiftUI

struct TextFieldWithIcon: View {
    @Binding var value:String
    @State var iconName:String
    @State var placeholder:String
    var body: some View {
        TextField("\(placeholder)", text: $value)
            .padding(10)
            .padding(.leading, 25)
            .background(RoundedRectangle(cornerRadius: 15).stroke())
            .overlay(
                HStack {
                    Image(systemName: iconName)
                        .foregroundColor(.gray)
                        .padding(.leading, 10)
                    Spacer()
                }
            )
    }
}

#Preview {
    TextFieldWithIcon(value: .constant(""), iconName: "person", placeholder: "Email")
}
