//
//  CircularImage.swift
//  SwiftUIIntroApp
//
//  Created by Gangadhar C on 10/6/23.
//

import SwiftUI

struct CircularImage: View {
    var image:String
    var body: some View {
        Image(systemName: image).clipShape(Circle()).overlay{
            Circle().stroke(.blue,lineWidth: 2)
        }.foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    CircularImage(image: "car")
}
