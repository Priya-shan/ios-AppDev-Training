//
//  BusyView.swift
//  ShanmugaPriya-SwiftUI-Project
//
//  Created by Shanmuga Priya M on 17/10/23.
//

import SwiftUI

struct BusyView: View {
    var message:String
    var body: some View {
        ZStack{
            BackgroundView()
            VStack {
                ProgressView("")
                    .progressViewStyle(CircularProgressViewStyle())
    //                .tint(Color("PrimaryColor"))
                    .scaleEffect(3)
                
                Text(message)
                    .font(.title2)
            }
            .padding()
        }
       
    }
}

#Preview {
    BusyView(message: Messages.Authenticating)
}
