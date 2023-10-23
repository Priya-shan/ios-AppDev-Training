//
//  Profile.swift
//  prograd-swiftUi
//
//  Created by Shanmuga Priya M on 09/10/23.
//

import SwiftUI

struct Profile: View {
//    @Binding var name :String
    var name = "priya"
    var imgName = "profile"
    @State var dev:Developer
    var body: some View {
        ZStack{
            LinearGradient(
                colors: [.black, .white ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing)
            .ignoresSafeArea()
            VStack{
                ProfileImageView(imgName:imgName)
//                ProfileImage(imageName: imgName)
                VStack(alignment: .center){
                    Text("Name : \(name)")
                    Text("Experience 6 years in ios")
                }.padding(.horizontal, 20)
                    .bold()
                    .font(.title2)
            }
            Spacer()
        }
        .navigationTitle("\(dev.name)")
    }
    }

struct ProfileImageView:View {
    var imgName:String;
    var body: some View {
        Image(imgName)
            .resizable()
            .frame(width:150,height:150)
            .cornerRadius(100)
    }
}

#Preview {
    Profile(dev :Developer(name: "String", technology: "String"))
}

struct Developer: Identifiable{
    var id = UUID()
    var name : String
    var technology:String
}
struct Project: Identifiable{
    var id = UUID()
    var name:String
    var devs:[Developer]
}
