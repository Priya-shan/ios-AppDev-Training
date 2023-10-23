//
//  ContentView.swift
//  prograd-swiftUi
//
//  Created by Shanmuga Priya M on 06/10/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
//            Color(red: 0.2, green: 0.5, blue: 0.8)
            VStack {
                //            Image(systemName: "globe").resizable()
                //                .imageScale(.large)
                //                .foregroundStyle(.black).frame(width: 50,height: 50)
                
                
                Image("sampleImage").resizable().frame(width: 100,height: 100)
                    .cornerRadius(50)
                
                Text("Plantier").bold().font(.title2).padding(10)
                Button("Get Started") {
                    print("button tapped")
                }.padding(10)
                    .foregroundColor(Color.black)
                    .background(Color.green)
                    .cornerRadius(5)
            }
            .padding()
        }.ignoresSafeArea()
       
    }
}

#Preview {
    ContentView()
}

