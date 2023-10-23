//
//  RgbSlider.swift
//  prograd-swiftUi
//
//  Created by Shanmuga Priya M on 06/10/23.
//

import SwiftUI

struct RgbSlider : View{
    
    @State var red :Double = 0
    @State var green :Double = 0
    @State var blue :Double = 0
    var body : some View{
        ZStack {

                    Color(red: red, green: green, blue: blue)

                        .ignoresSafeArea()

                    VStack {

                        Spacer()

                        Text("Move sliders to adjust the color")

                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)

                            .foregroundColor(.white)

                        Spacer()

                        Slider(value: $red, in: 0...1)

                            .frame(width: 300.0)

                            .accentColor(.red)

                        Spacer()

                        Slider(value: $green, in: 0...1)

                            .frame(width: 300.0)

                            .accentColor(.green)

                        Spacer()

                        Slider(value: $blue, in: 0...1)

                            .frame(width: 300.0)

                            .accentColor(.blue)

                        Spacer()

                    }

                }
    }
}


#Preview {
    RgbSlider()
}
