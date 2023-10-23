//
//  ListsView.swift
//  SwiftUIIntroApp
//
//  Created by Gangadhar C on 10/6/23.
//

import SwiftUI
struct Car:Identifiable{
//    var CarId:Int //This used to identify but with identifiable protocal
    var id = UUID()
    var name:String
    var make:String
}
struct ListsView: View {
//    var cars = ["BMW","Audi","Ferrari","Porsche","Aston Martin", "Alfa Romeo","Renault","Nissan","Tata","Subaru","Konnesiegg","Maserati","Mazda"]
    @State var cars:[Car] = [
        Car(name: "Mustang", make: "Ford"),
        Car(name: "F150", make: "Ford"),
        Car(name: "Aventador", make: "Lamborghini"),
        Car(name: "Roadster", make: "Tesla")
    ]
    var body: some View {
        Button("Add",systemImage:"plus") {
            cars.append(Car(name: "newCar", make: "newCar"))
            
        }
//            List(cars, id:\.CarId){
            List(cars){ car in
                CarRow(car:car)
            }
        
    }
}

#Preview {
    ListsView()
}
