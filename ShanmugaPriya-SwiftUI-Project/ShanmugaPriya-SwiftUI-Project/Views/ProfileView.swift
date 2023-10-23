//
//  ProfileView.swift
//  ShanmugaPriya-SwiftUI-Project
//
//  Created by Shanmuga Priya M on 17/10/23.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var api = Api()
    @Environment(\.openURL) var openURL
    var body: some View {
        ZStack{
            BackgroundView()
            VStack{
                HStack{
                    Spacer()
                Image(systemName: "rectangle.portrait.and.arrow.right")
                        .onTapGesture {
                            UserDefaults.standard.removeObject(forKey: "loggedIn")
                        }
                }
                .padding()
                Spacer()

                VStack{
                    AsyncImage(url: URL(string: api.singleUserInstance.avatar)) { image in
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
                   
                    Text(api.singleUserInstance.fullName)
                        .font(.title)
                    Text(api.singleUserInstance.email)
                        .font(.title3)
                    
                    
                    VStack{
                        CustomButton(action: {
                            if
                                UIApplication.shared.canOpenURL(URL(string:"\(api.support.url)")!){
                                UIApplication.shared.open(URL(string: "\(api.support.url)")!)
                            }
                            
                            openURL(URL(string: "\(api.support.url)")!)
                        }, buttonName: "Support Url", buttonWidth: 200)
                        
                        Button(action: {
                            if let url = URL(string: "tel:\(9080888421)") {
                                if UIApplication.shared.canOpenURL(url) {
                                    UIApplication.shared.open(url)
                                } else {
                                    print("Cannot open the dialpad")
                                }
                            } else {
                                print("Invalid phone number")
                            }
                        }) {
                            Text("9080888421")
                                .font(.title2)
                        }
                        .padding(10)
                        .frame(width: 200)
                        .background(Color("PrimaryColor"))
                        .cornerRadius(10)
                        
                        
                    }
                    .frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .center)
                }
                 Spacer()
            }
            }
           
        .onAppear(){
           api.fetchUserById()
        }
        }
    
    
}

#Preview {
    ProfileView()
}
