//
//  animation.swift
//  ShanmugaPriya-SwiftUI-Project
//
//  Created by Shanmuga Priya M on 20/10/23.
//

import SwiftUI

//
//  HeartAnimation.swift
//  training
//
//  Created by Yaswanth on 20/10/23.
//

import SwiftUI

struct animation: View {
    @State var transY: CGFloat = 0
    @State var alpha: CGFloat = 1.0
    var foreverAnimation =
            Animation.linear.speed(0.3)
                .repeatForever(autoreverses: true)
    var body: some View {
        VStack {
            Image(systemName: "heart")
                .font(.system(size: 60))
                .foregroundColor(Color.green)
                .offset(x: 0, y: transY)
                  .onAppear {
                      withAnimation(foreverAnimation) {
                          transY = -25
                      }
                  }
            VStack{
              }.frame(width: 50, height: 10, alignment: .center)
                  .background(Color.blue)
                  .cornerRadius(10.0)
                  .opacity(alpha)
                  .scaleEffect(x: alpha, y: 1.0, anchor: UnitPoint.center)
                  .onAppear {
                      withAnimation(foreverAnimation) {
                          alpha = 0.4
                      }
                  }
        }
    }
}

#Preview {
    animation()
}
