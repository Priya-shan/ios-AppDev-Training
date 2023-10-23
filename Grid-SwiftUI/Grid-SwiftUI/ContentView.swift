//
//  ContentView.swift
//  Grid-SwiftUI
//
//  Created by Shanmuga Priya M on 10/10/23.
//

import SwiftUI

struct ContentView: View {
    static var startCol = 2
    @State  var columns = startCol
    @State var gridColumns = Array(repeating: GridItem(.flexible()), count: startCol)
    @State var showAlert = false
    @State var addImage:String=""
    @State var isTapped: Bool = false
    @State private var isLongPressing = false
    @State var showConfirmation = false
    @State private var isShowingSheet = false
    @State var systemImages = [
        SystemImages(name: "car", isHovered: false, color:.black),
        SystemImages(name: "star", isHovered: false,color:.black),
        SystemImages(name: "eraser", isHovered: false,color:.black),
        SystemImages(name: "car", isHovered: false,color:.black),
        SystemImages(name: "pencil", isHovered: false,color:.black),
        
    ]
    
    var body: some View {
        VStack {
            Stepper("Grid columns", value: $columns, in: 1...6) {
                c in
                withAnimation{
                    gridColumns = Array(repeating: GridItem(.flexible()), count: columns)
                }
            }
            ScrollView {
                LazyVGrid(columns: gridColumns) {
                 
                    ForEach(systemImages, id: \.id) {
                        image in Image(systemName: image.name)
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(image.color)
                            .symbolRenderingMode(.multicolor)
                            
                            .onTapGesture{
                                showConfirmation.toggle()
                            }
                                .alert("Are you sure to delete this ?", isPresented: $showConfirmation){
                                    Button("Delete"){
                                        systemImages.removeAll { SystemImages in
                                            SystemImages.id == image.id
                                        }
                                        
                                    }
                                } message : {
                                }
                            }
                    }
                }
            }
            Spacer()
        
            Button("ADD"){
                showAlert.toggle()
                isShowingSheet = true
            }
            .sheet(isPresented: $isShowingSheet, content: {
                TextField("Enter name", text: $addImage)
                    .autocorrectionDisabled()
                    .onSubmit { }
                Image(systemName: "minus.square")
                Button("Add"){
                    print("adding")
                    guard let image =  UIImage(systemName: addImage.lowercased())
                    else{
                        print("Not found")
                        return
                    };
            })
//            .alert("Add Image", isPresented: $showAlert){
//                TextField("Enter name", text: $addImage)
//                    .autocorrectionDisabled()
//                    .onSubmit { }
//                Image(systemName: "minus.square")
//                Button("Add"){
//                    print("adding")
//                    guard let image =  UIImage(systemName: addImage.lowercased())
//                    else{
//                        print("Not found")
//                        return
//                    }
//                    print(addImage)
//                    systemImages.append( SystemImages(name: "\(addImage.lowercased())",color: .black))
//                    addImage=""
//                }
//            } message : {
//            }
        }
        
    func addIcon(){
        
    }
    }
    
    struct SystemImages:Identifiable {
        var id = UUID()
        var name: String
        var isHovered: Bool = false
        var color:Color
        mutating func setColor(_ newColor: Color) {
            self.color = newColor
        }
    }
    

#Preview {
    ContentView()
}

