//
//  Users.swift
//  ShanmugaPriya-SwiftUI-Project
//
//  Created by Shanmuga Priya M on 17/10/23.
//

import Foundation

struct User: Identifiable, Decodable, Encodable{
    let id: Int
        let first_name: String
        let last_name: String
        let email: String
        let avatar: String
        
        // Helper method to get the full name
        var fullName: String {
            return "\(first_name) \(last_name)"
        }
}
