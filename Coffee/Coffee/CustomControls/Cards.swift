//
//  Cards.swift
//  Coffee
//
//  Created by Shanmuga Priya M on 17/10/23.
//

import SwiftUI

struct Cards: View {
    var card:CardsClass
    var body: some View {
            VStack(alignment: .leading){
                Image(card.imageName)
                    .resizable()
                    .frame(width: 150,height: 130)
                    .scaledToFit()
                    .cornerRadius(20)
                Text(card.name)
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.leading,10)
                Text(card.subName)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.leading,10)
                HStack{
                    Text(card.amount)
                        .font(.system(size: 22))
                        .foregroundColor(Color("darkGreen"))
                        .fontWeight(.bold)
                    Spacer()
                    Image(systemName: "plus")
                        .padding(10)
                        .background(Color("primaryColor"))
                        .cornerRadius(15)
                        .foregroundColor(.white)
                }.padding(.leading,10)
                
            }
            .overlay(
                UnevenRoundedRectangle(topLeadingRadius: 20,bottomTrailingRadius: 20)
                    .background(Color.gray).opacity(0.4)
                    .overlay(
                        HStack{
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                            Text(card.rating)
                                .foregroundColor(.white)
                        }
                        
                    )
                    .frame(width: 70,height: 35)
                    .offset(x:-40,y:-95)
                    
            )
            
            .frame(width: 150)
                .background(RoundedRectangle(cornerRadius: 15).fill(Color.white))
                .padding()
                
    }
}

#Preview {
    Cards(card: CardsClass(name: "Cappuccino", subName: "With Chocolate", amount: "$ 4.53", imageName: "coffee1",rating: "4.5"))
}
