//
//  ProfileImage.swift
//  prograd-swiftUi
//
//  Created by Shanmuga Priya M on 09/10/23.
//

import SwiftUI

struct ProfileImage: View {
    var imageName:String;
        var body: some View {
            Image(imageName)
                .resizable()
                .frame(width:200,height:200)
                .cornerRadius(100)
        }
    }
#Preview {
    ProfileImage(imageName:"profile")
}
