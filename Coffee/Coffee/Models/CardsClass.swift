//
//  CardsClass.swift
//  Coffee
//
//  Created by Shanmuga Priya M on 18/10/23.
//

import Foundation

class CardsClass{
    var name:String = ""
    var subName:String = ""
    var amount:String = ""
    var imageName:String = ""
    var rating:String = ""
    init(name: String, subName: String, amount: String, imageName: String, rating: String) {
            self.name = name
            self.subName = subName
            self.amount = amount
            self.imageName = imageName
            self.rating = rating
    }
}
