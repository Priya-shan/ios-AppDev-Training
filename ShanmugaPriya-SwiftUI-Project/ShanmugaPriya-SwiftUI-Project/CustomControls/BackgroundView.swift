//
//  BackgroundView.swift
//  ShanmugaPriya-SwiftUI-Project
//
//  Created by Shanmuga Priya M on 15/10/23.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        LinearGradient(
            colors: [Color("PrimaryColor") , Color("SecondayColor")],
            startPoint: .topLeading,
            endPoint: .bottomTrailing)
        .ignoresSafeArea()
    }
}

#Preview {
    BackgroundView()
}
