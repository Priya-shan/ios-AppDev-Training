//
//  singleUser.swift
//  ShanmugaPriya-SwiftUI-Project
//
//  Created by Shanmuga Priya M on 18/10/23.
//

import Foundation

struct singleUser: Identifiable, Decodable, Encodable{
        let id: Int
        let first_name: String
        let last_name: String
        let email: String
        let avatar: String
        var fullName: String {
            return "\(first_name) \(last_name)"
        }
    
    
}
