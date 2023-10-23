//
//  SectionListView.swift
//  prograd-swiftUi
//
//  Created by Shanmuga Priya M on 09/10/23.
//

import SwiftUI

struct SectionListView: View {
    @State var names = ["Ananth","Ramya"]
    @State var addName = ""
    @State var showInput:Bool = false
    @State var icon:Bool = true
    @State var showAlert = true
//    @State private var nameToPass :String = "passedName"
    
    let projects = [
        Project(name: "Draftkings", devs: [Developer(name: "Arun", technology: "Android"),Developer(name: "Priya", technology: "ios")]),
        Project(name: "Uber", devs: [Developer(name: "smith", technology: "Android"), Developer(name: "varun", technology: "ios")])
    ]
    private func delete(at indexSet: IndexSet){
        self.names.remove(atOffsets:indexSet)
    }
    var body: some View {
        NavigationView{
            
            
            VStack{
                //            List(names, id: \.self){
                //                name in Text("\(name)")
                //            }
                //                TextField("Enter name", text: $addName)
                //                Button("Add"){
                //                    names.append(addName)
                //                    addName=""
                //                }
                if(showInput){
                    
                    //                    TextField("Enter name", text: $addName)
                    //                        .padding(12)
                    //                        .textFieldStyle(.roundedBorder)
                    //                        .autocorrectionDisabled()
                    //                        .onSubmit {
                    //                            names.append(addName)
                    //                            addName=""
                    //                        }
                }
                List{
                    ForEach(names, id : \.self){
                        name in Text("\(name)")
                    }.onDelete(perform: delete)
                }
                List{
                    ForEach(projects) { project in
                        
                        Section(header: Text("Project Name -  \(project.name)")){
                            ForEach(project.devs) { dev in
                                NavigationLink{
//                                    Profile(dev:devll)
                                }label:{
                                    HStack{
                                        Text(dev.name)
                                        Spacer()
                                        Text(dev.technology)
                                    }
                                }
                               
                                
                            }
                        }
                    }
                }
            }.navigationTitle("More Lists")
                .navigationBarItems(trailing: Button(action:{
//                    showInput.toggle()
//                    icon.toggle()
                    print("testing")
                    showAlert.toggle()
                },label:{
                    if(showInput){
                        Image(systemName:"minus.square")
                    }
                    else{
                        Image(systemName:"plus.app")
                    }
                    
                }))
//                .actionSheet(isPresented: $showAlert){
//                    ActionSheet(title: Text("Options"), message: Text("hi"),
//                        buttons : [ 
//                        .default(Text("One")){
//                            print("one")
//                        },
//                        .default(Text("Two")){
//                            print("Two")
//                        },
//                        .default(Text("Cancel")){
//                            print("Cancel")
//                        }]
//                )}
            
                .alert("some alert1", isPresented: $showAlert){
                    TextField("Enter name", text: $addName)
                        .autocorrectionDisabled()
                        .onSubmit {
//                            names.append(addName)
//                            addName=""
                        }
                    Button("Add"){
                        names.append(addName)
                        addName=""
                    }
                } message : {
//                    if(showAlert){
                        Text("textfield expanded")
//                    }
//                    else{heel
//                        Text("textfield minimized")
//                    }
                    
                }
            
        }
    }
    
    struct Developer: Identifiable{
        var id = UUID()
        var name : String
        var technology:String
    }
    struct Project: Identifiable{
        var id = UUID()
        var name:String
        var devs:[Developer]
    }
}
#Preview {
    SectionListView()
}
