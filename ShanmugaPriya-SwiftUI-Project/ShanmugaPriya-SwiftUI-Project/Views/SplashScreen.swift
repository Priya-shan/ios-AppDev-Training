//
//  SplashScreen.swift
//  ShanmugaPriya-SwiftUI-Project
//
//  Created by Shanmuga Priya M on 10/10/23.
//

import SwiftUI

struct SplashScreen: View {
    @State private var isLoginViewActive = false
    var body: some View {
        NavigationView {
            ZStack{
                BackgroundView()
                VStack{
                    Image("loginPageImg")
                        .resizable()
                        .frame(width: 300,height: 300)
                    
                    Text("PeopleCue").bold().font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    Text(Labels.Caption).font(.caption)
                }
                
            }
        }
    }
}

#Preview {
    SplashScreen()
}
