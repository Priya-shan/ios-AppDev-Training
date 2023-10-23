//
//  AddUser.swift
//  ShanmugaPriya-SwiftUI-Project
//
//  Created by Shanmuga Priya M on 17/10/23.
//

import SwiftUI
import UIKit
struct AddUser: View {
    @ObservedObject var api = Api()
    @Binding var users:[User]
    @State var firstName:String=""
    @State var lastName:String=""
    @State var email:String=""
    @State var showImagePicker: Bool = false
    @State var image: Image? = nil
    @State var imageSelected:Bool = false
    @State var text:String = ""
    @State var textStyle = UIFont.TextStyle.headline
    @State var selectedImage : UIImage = .girlWithLap
    @State var mediaUrl : String = "123"
    @State var sheetPresented : Bool = false
    @Binding var sheetPresented1:Bool
    let newUser = User(id: 24, first_name: "John", last_name: "Doe", email: "john.doe@example.com", avatar: "avatar_url")
    var body: some View {
        ZStack{
            BackgroundView()
            VStack{
                TextFieldWithIcon(value: $firstName, iconName: "person", placeholder: Placeholder.FirstName)
                TextFieldWithIcon(value: $lastName, iconName: "person", placeholder: Placeholder.LastName)
                TextFieldWithIcon(value: $email, iconName: "envelope", placeholder: Placeholder.Email)
                
                ZStack{
                    Image(uiImage: selectedImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200,height: 200)
                    
                    Button(action: {
                        self.sheetPresented.toggle()
                    }) {
                        VStack{
                            Image(systemName: "camera")
                                .resizable()
                                .frame(width: 40,height: 30)
                        }.padding(.leading,140)
                            .padding(.bottom,150)
                        
                    }
                }
                .padding(20)
                .sheet(isPresented: $sheetPresented, content: {
                    
                    ImagePicker(selectedImage: $selectedImage, imagePath: $mediaUrl)
                    
                        .presentationDetents([.medium])
                    
                })
                CustomButton(action: {
                    api.addUser(newUser: newUser)
                    users.append(User(id: 22, first_name: firstName, last_name: lastName, email: email, avatar: "https://reqres.in/img/faces/3-image.jpg"))
                    sheetPresented1=false
                }, buttonName: "Add User", buttonWidth: 100)
            }.padding()
        }}
}
//
//#Preview {
//    AddUser(users: <#T##Binding<[User]>#>, mediaUrl: <#T##String#>)
//}
