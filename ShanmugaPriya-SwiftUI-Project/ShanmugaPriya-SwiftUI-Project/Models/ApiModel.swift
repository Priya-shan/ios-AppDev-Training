//
//  ApiModel.swift
//  ShanmugaPriya-SwiftUI-Project
//
//  Created by Shanmuga Priya M on 17/10/23.
//

import Foundation
struct LoginResponse : Codable{
    var token : String
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.token = try container.decode(String.self, forKey: .token)
//    }
}
struct LoginParams:Codable {
    var email : String
    var password : String
}
