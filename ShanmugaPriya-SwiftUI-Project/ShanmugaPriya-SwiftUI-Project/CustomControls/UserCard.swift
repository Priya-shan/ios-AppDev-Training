//
//  UserCard.swift
//  ShanmugaPriya-SwiftUI-Project
//
//  Created by Shanmuga Priya M on 17/10/23.
//

import SwiftUI
struct UserCard:View {
    let user: User
    var body: some View {
        VStack(alignment: .center, spacing: 5) {
                    RemoteImage(url: URL(string: user.avatar)!)
                    
                    Text(user.fullName)
                        .font(.headline)
                }
                .frame(maxWidth:130,maxHeight: 200)
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                
//        
//        VStack(alignment: .center, spacing: 10) {
//            HStack{
//                RemoteImage(url: URL(string: user.avatar)!)
//                VStack(alignment: .leading){
//                    HStack{
//                        Text(user.fullName)
//                            .font(.headline)
//                        Image(systemName: "greaterthan")
//                            .resizable()
//                            .frame(width: 10,height: 10)
//                            .padding(8)
//                            .foregroundColor(.black)
//                    }
//                    
//                }
//            }}
//                .padding()
//                .background(Color.white)
//                .cornerRadius(10)
//                .shadow(radius: 5)
//                .padding(.horizontal)
//                .padding(.bottom, 10)
    }
    
    
}

#Preview {
    UserCard(user: User(id: 3, first_name: "Priya", last_name: "Shan", email: "priyashan0312@gmail.com", avatar: "https://reqres.in/img/faces/1-image.jpg"))
}
