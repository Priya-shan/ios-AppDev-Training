//
//  HomeView.swift
//  ShanmugaPriya-SwiftUI-Project
//
//  Created by Shanmuga Priya M on 17/10/23.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var api = Api()
    @State var sheetPresented : Bool = false
       let columns = [
        GridItem(spacing: 0),
        GridItem(spacing: 0)
       ]
        var body: some View {
            NavigationView {
            ZStack{
                BackgroundView()
                VStack{
                    HStack{
                        Text("People Cues")
                            .font(.title)
                        Spacer()
                            Image(systemName: "plus")
                                .resizable()
                                .frame(width: 15,height: 15)
                                .padding(10)
                                .background(RoundedRectangle(cornerRadius: 50).stroke(Color.black))
                                .foregroundColor(.black)
                                .onTapGesture {
                                    sheetPresented=true
                                }
                            
                        
                        NavigationLink(destination: ProfileView()){
                            Image(systemName: "person")
                                .resizable()
                                .frame(width: 15,height: 15)
                                .padding(10)
                                .background(RoundedRectangle(cornerRadius: 50).stroke())
                                .foregroundColor(.black)
                        }
                        
                        
                    }
                    .padding(.horizontal, 20)
                    //                    -- horizontal individual view without list --
                    //                        ScrollView {
                    //                            LazyVStack {
                    //                                ForEach(api.users) { user in
                    //                                    UserCard(user: user)
                    //                                        .frame(width: 500)
                    //                                        .padding(.bottom, 10)
                    //                                }
                    //                            }
                    //                    -- List View --
                    //                    List (api.users){user in
                    //                        UserCard(user: user)
                    //                            .frae(width: 500)
                    //                            .padding(.bottom, 10)
                    //                        }
                    //                    .scrollContentBackground(.hidden)
                    
                    //                    -- Grid View --
                    ScrollView{
                        LazyVGrid(columns: columns) {
                            ForEach(api.users.reversed()) { user in
                                
                                NavigationLink(destination: UserDetails(user: user)){
                                    UserCard(user: user)
                                        .padding(5)
                                        .foregroundColor(.black)
                                }
                                
                                
                            }
                        }
                        
                    }}
                    }
                    .onAppear {
                        api.fetchUsers()
                    }
                    .sheet(isPresented: $sheetPresented, content: {
                        AddUser(users:$api.users, sheetPresented1: $sheetPresented) .presentationDragIndicator(.visible)
                        
                            })
                   
                }
                
            }
          
        }


#Preview {
    HomeView()
}
