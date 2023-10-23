//
//  UserDetails.swift
//  ShanmugaPriya-SwiftUI-Project
//
//  Created by Shanmuga Priya M on 17/10/23.
//

import SwiftUI

struct UserDetails: View {
    var user:User
    var body: some View {
        NavigationView{
            ZStack{
                BackgroundView()
                ZStack{
                    Image("banner")
                        .resizable()
                }
                VStack{
                    AsyncImage(url: URL(string: user.avatar)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } placeholder: {
                        Color.gray
                    }
                    .cornerRadius(50)
                    .frame(width: 300,height: 200)
                    .padding(.top,50)
                    .padding(.horizontal,30)
                    
                    Text(user.fullName)
                        .font(.title)
                    Text(user.email)
                        .font(.title3)
                    
                }
                
            }
        }
        }
       
}

#Preview {
    UserDetails(user: User(id: 24, first_name: "John", last_name: "Doe", email: "john.doe@example.com", avatar: "https://reqres.in/img/faces/12-image.jpg"))
}
