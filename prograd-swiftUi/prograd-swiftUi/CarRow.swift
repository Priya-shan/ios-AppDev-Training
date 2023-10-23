//
//  CarRow.swift
//  SwiftUIIntroApp
//
//  Created by Gangadhar C on 10/6/23.
//

import SwiftUI

struct CarRow: View {
    var car:Car
    var body: some View {
        HStack{
            CircularImage(image: "car")
            Text("\(car.make) \(car.name)")
        }
    }
}

#Preview {
    CarRow(car:Car(name: "ford", make: "ford"))
}
