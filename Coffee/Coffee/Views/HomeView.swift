//
//  HomeView.swift
//  Coffee
//
//  Created by Shanmuga Priya M on 17/10/23.
//

import SwiftUI

struct HomeView: View {
    let cards: [CardsClass] = [
        CardsClass(name: "Cappuccino", subName: "With Chocolate", amount: "$ 4.53", imageName: "coffee1",rating: "4.8"),
        CardsClass(name: "Cappuccino", subName: "With Oat Milk", amount: "$ 3.90", imageName: "coffee2",rating: "4.3"),
        CardsClass(name: "Cappuccino", subName: "With Chocolate", amount: "$ 4.53", imageName: "coffee3",rating: "4.5"),
        CardsClass(name: "Cappuccino", subName: "With Oat Milk", amount: "$ 3.90", imageName: "coffee4",rating: "4.2"),
    ]
    @State var value:String
    @State private var selectedOption = 0
    var body: some View {
        VStack{
            ZStack{
                LinearGradient(colors: [Color("black1"),Color("black2")], startPoint: .topLeading, endPoint: .bottomTrailing)
                
                VStack{
                    HStack{
                        VStack(alignment: .leading){
                            Text("Location")
                                .font(.caption)
                            HStack{
                                Text("Bilzun, Thanjungbalai")
                                    .font(.title3)
                                Image(systemName: "chevron.down")
                            }
                            
                        }
                        Spacer()
                        VStack{
                            Image("profile")
                                .resizable()
                                .frame(width: 70,height: 70)
                                .cornerRadius(25)
                            
                        }
                        
                    }
                    .padding(.horizontal, 70)
                    .foregroundColor(.white)
                    HStack{
                        TextField("Search Coffee", text: $value)
                            .padding(15)
                            .padding(.leading, 35)
                            .background(RoundedRectangle(cornerRadius: 20).fill(Color("gray")))
                            .overlay(
                                HStack {
                                    Image(systemName: "magnifyingglass")
                                        .foregroundColor(.white)
                                        .padding(.leading, 10)
                                    Spacer()
                                    Image( systemName: "slider.horizontal.3")
                                        .foregroundColor(.white)
                                        .padding(.trailing, 10)
                                        .padding(15)
                                        .background(RoundedRectangle(cornerRadius: 20).fill(Color("primaryColor")))
                                    
                                }
                            )
                            .foregroundColor(.gray)
                            .padding(.horizontal,60)
                            .padding(.leading, 10)
                    }
                   
                }.padding(.top,-50)
            }.frame(width:500,height: 350)
                .ignoresSafeArea(.all)
            ZStack{
                VStack{
                    ScrollView(.horizontal,showsIndicators: false){
                        CustomSegmentedPicker(selectedIndex: $selectedOption, titles: ["Cappuccino", "Machiato", "Latte", "Americano", "Cappuccino"], font: .system(size: 15))
                    }.padding(.horizontal)
                    
                    ScrollView(.vertical){
                        VStack{
                            LazyVGrid(columns: [GridItem(.flexible(minimum: 150, maximum: 200)), GridItem(.flexible(minimum: 150, maximum: 200))], spacing: 20) {
                                            ForEach(cards, id: \.imageName) { card in
                                                Cards(card: card)
                                            }
                                        }
                                        .padding()
                        }
                    }
                    
                }.background(Color("MildWhite"))
            }
//            BottomTabBar()
                
        }
        .overlay(
            PromoCard()
                .offset(x: 0, y: -110)
        )
        .background(Color("MildWhite"))

        }
}

#Preview {
    HomeView(value: "Search Coffee")
}
struct CustomSegmentedPicker: View {
    @Binding var selectedIndex: Int
    let titles: [String]
    let font: Font

    var body: some View {
        HStack {
            ForEach(0..<titles.count, id: \.self) { index in
                Button(action: {
                    selectedIndex = index
                }) {
                    Text(titles[index])
                        .padding()
                        .background(selectedIndex == index ? Color.orange : Color.white)
                        .foregroundColor(selectedIndex == index ? Color.white : Color.black)
                        .font(font)
                        .cornerRadius(10)
                }
            }
        }
    }
}



