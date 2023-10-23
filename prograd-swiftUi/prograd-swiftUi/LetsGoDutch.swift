//
//  LetsGoDutch.swift
//  prograd-swiftUi
//
//  Created by Shanmuga Priya M on 06/10/23.
//

import SwiftUI

struct LetsGoDutch: View {
    @State var billAmount = 700.0
    @State var tip = 0
    @State var numberOfPeople=2
    @FocusState var isFocussed:Bool
    
    let tipPercentages = [10,15,20]
    let peoples = [2,3,4,5,6,7,8]
    var amountperPerson: Double{
        let tipPlusBill = billAmount + (billAmount * (Double(tip)/100.0))
        return tipPlusBill/Double(numberOfPeople)
    }
    

   
    var body: some View {
        NavigationView{
            Form {
                Section("Enter Bill Amount"){
                    TextField("hello",value: $billAmount, format: .currency(code: "INR")).keyboardType(.decimalPad)
                        .focused($isFocussed)
                        .onSubmit {
                            isFocussed=false
                        }
                }
                
                Section("Select a Tip"){
                    
                    Picker(selection: $tip, label: Text("Choose a tip")){
                        ForEach(tipPercentages, id: \.self){
                            tip in
                            Text("\(tip)")
                        }
                    }.pickerStyle(.segmented)
                }
                
                Section{
                    Picker(selection: $numberOfPeople, label: Text("Number of People")){
                        ForEach(peoples,id:\.self){
                            n in
                            Text("\(n)")
                        }
                    }
                }
                
                Section("Amount per Person"){
                    Text("\(amountperPerson)")
                }
                
            }.navigationTitle("Lets Go Dutch")
                .toolbar{
                    ToolbarItemGroup(placement: .keyboard){
                        Button("Done"){
                            isFocussed = false
                        }
                    }
                }
        }
        
    }
}

#Preview {
    LetsGoDutch()
}
