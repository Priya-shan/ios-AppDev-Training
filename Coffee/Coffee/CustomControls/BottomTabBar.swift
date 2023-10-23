//
//  BottomTabBar.swift
//  Coffee
//
//  Created by Shanmuga Priya M on 17/10/23.
//

import SwiftUI

struct BottomTabBar: View {
    @State private var selectedItemIndex: Int = 0
    var body: some View {
        VStack(spacing: 0) {
            switch selectedItemIndex {
            case 0:
                HomeView(value: "str")
            case 1:
                LikedItemsView()
            case 2:
                OrdersView()
            case 3:
                NotificationsView()
            default:
                HomeView(value: "str")
            }
            
            HStack {
                Spacer()
                Image(systemName: "house")
                    .padding(10)
                    .foregroundColor(.black)
                    .onTapGesture {
                        selectedItemIndex=0
                    }
                Spacer()
                    Image(systemName: "heart.fill")
                        .foregroundColor(.black)
                        .onTapGesture {
                            selectedItemIndex=1
                        }
                Spacer()
                    Image(systemName: "bag.fill")
                        .foregroundColor(.black)
                        .onTapGesture {
                            selectedItemIndex=2
                        }
                Spacer()
                    Image(systemName: "bell.fill")
                        .foregroundColor(.black)
                        .onTapGesture {
                            selectedItemIndex=3
                        }
                Spacer()
            }
            .frame(maxHeight: 50, alignment: .bottom)
            .background(Color("MildWhite"))
            .clipShape(UnevenRoundedRectangle(topLeadingRadius: 30, topTrailingRadius: 30))
        }
        .background(Color("MildWhite"))
    }
}


#Preview {
    BottomTabBar()
}
