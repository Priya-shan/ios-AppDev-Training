// RegistrationView.swift
//  ShanmugaPriya-SwiftUI-Project
//
//  Created by Shanmuga Priya M on 10/10/23.
import SwiftUI
import AlertToast
struct RegistrationView: View {
    @State var MoveToLoginView:Bool=false
//    let emailRegex = Constants.emailRegex
    @State var password:String = ""
    @State var confirmPassword:String = ""
    @State var email : String = ""
    @State var username : String = ""
    @State var showToastMessage : Bool = false
    @State private var isPasswordVisible: Bool = false
    @State var isSuccess:Bool = false
    @State var isValidationPassed:Bool = false
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var network = NetworkMonitor()
    var body: some View {
        ZStack{
            BackgroundView()
            VStack(spacing:30){
                
                Image("signup")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300,height: 300)
                
                VStack(alignment: .leading, spacing: 15){
                    
                    Text("Hello Newbie ! ").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    Text("Register now and join the family").padding(.bottom,10)
                    
                    TextFieldWithIcon(value: $username, iconName : "person",placeholder: Placeholder.UserName)
                    TextFieldWithIcon(value: $email,iconName : "envelope", placeholder: Placeholder.Email)
                    PasswordFieldWithIcon(isPasswordVisible:isPasswordVisible,value: $password,placeholder: Placeholder.Password)
                    PasswordFieldWithIcon(isPasswordVisible:isPasswordVisible,value: $confirmPassword,placeholder: Placeholder.ConfirmPassword)
                }.padding(.horizontal, 20)
                VStack(alignment: .center){
                    CustomButton(action:{
                        validateForm(userName: username, email: email, password: password, confirmPassword: confirmPassword)
                        
                        if(!network.isConnected){
                            showToastMessage = true
                            isSuccess=false
                            Constants.toastMessage = Messages.NetworkErrorMessage
                        }
                            else {
                           MoveToLoginView = true
                       }
                    }, buttonName: Labels.Register, buttonWidth: 200)
                      
//                    NavigationLink(destination: LoginView(email: "", password: "")) {
//                        Text("Already a User? Login Now")
//                            .font(.caption)
//                    }
                    Text("Already a User? Login Now")
                        .font(.caption).onTapGesture {
                            presentationMode.wrappedValue.dismiss()
                        }
                    
                    .navigationBarBackButtonHidden(true)
                    
                }
            }
            .toast(isPresenting: $showToastMessage) {
                AlertToast(displayMode: .hud,
                           type: isSuccess ? .complete(.green) : .error(.red),
                           title: Constants.toastMessage)
            }
            .navigationBarBackButtonHidden()
        }
      
    }
    
    func validateForm(userName:String, email:String, password:String, confirmPassword:String){
        if(username == "" || email == "" || password == "" || confirmPassword == ""){
            showToastMessage = true
            isSuccess=false
            Constants.toastMessage = Messages.RequiredFieldsNotFilled
            print(Messages.RequiredFieldsNotFilled)
        }
        else if(!email.isValidEmail()){
            showToastMessage = true
            isSuccess=false
            Constants.toastMessage = Messages.InvalidEmail
            print(Messages.InvalidEmail)
            return
        }
        else if (!password.isValidPassword()){
            print("checking pw")
            showToastMessage = true
            isSuccess=false
            Constants.toastMessage = Messages.InvalidPassword
            print(Messages.InvalidPassword)
            return
        }
        else if(password != confirmPassword){
            showToastMessage = true
            isSuccess=false
            Constants.toastMessage = Messages.PasswordsNotMatched
            print(Messages.PasswordsNotMatched)
            return
        }
        else{
            
            showToastMessage = true
            isSuccess=true
            Constants.toastMessage = "passed validation"
            isValidationPassed=true
            print("passed validation")
        }
    }
}

#Preview {
    RegistrationView()
    
}
