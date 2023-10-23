//
//  RemoteImage.swift
//  ShanmugaPriya-SwiftUI-Project
//
//  Created by Shanmuga Priya M on 17/10/23.
//

import SwiftUI

struct RemoteImage: View {
    let url: URL
        
        var body: some View {
            AsyncImage(url: url) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Color.gray
            }
            .frame(width: 100, height: 100)
            .cornerRadius(50)
        }
}

#Preview {
    RemoteImage(url: URL(string: "https://reqres.in/img/faces/7-image.jpg")!)
}
