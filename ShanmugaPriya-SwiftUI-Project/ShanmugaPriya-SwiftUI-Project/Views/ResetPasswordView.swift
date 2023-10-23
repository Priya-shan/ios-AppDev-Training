//
//  ResetPassword.swift
//  ShanmugaPriya-SwiftUI-Project
//
//  Created by Shanmuga Priya M on 15/10/23.
//

import SwiftUI

struct ResetPassword: View {
    @State var isCodeSent:Bool = false
    @State var isCodeVerified:Bool = false
    @State var isGetEmail:Bool = true
    var body: some View {
        ZStack{
            BackgroundView()
            VStack{
                Image("girlWithLap")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300,height: 300)
                VStack(alignment: .leading){
                    
                    Text("Reset Password !").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    if isGetEmail{
                        SendVerificationCodeForm(isCodeSent: $isCodeSent,isGetEmail:$isGetEmail)
                    }
                    if isCodeSent {
                        SubmitVerificationCodeForm(isCodeVerified:$isCodeVerified, isCodeSent:$isCodeSent,isGetEmail: $isGetEmail)
                    }
    //                isCodeSent ? SubmitVerificationForm() : Empty()
                    if isCodeVerified{
                        ResetPasswordForm()
                    }
                }.padding(.horizontal,20)
            }
            
        }
    }
   
}
struct ResetPasswordForm:View {
    @State var isPasswordVisible : Bool = false
    @State var password:String = ""
    @State var confirmPassword:String = ""
    
    var body: some View {
        VStack{
            VStack{
                
                PasswordFieldWithIcon(isPasswordVisible:isPasswordVisible,value: $password,placeholder: "New Password")
                    .padding(.bottom,10)
                PasswordFieldWithIcon(isPasswordVisible:isPasswordVisible,value: $confirmPassword,placeholder: " Confirm Password")
               
            }
            
            VStack{
                CustomButton(action:{
                    
                },buttonName: "Reset Password", buttonWidth: 200)
            }.padding(.vertical,20)
            
        }
    }
}
struct SubmitVerificationCodeForm:View {
    @Binding var isCodeVerified : Bool
    @Binding var isCodeSent : Bool
    @State var code:String = ""
    @Binding var isGetEmail : Bool
    var body: some View {
        VStack{
            VStack(alignment:.leading){
                TextFieldWithIcon(value: $code, iconName: "key", placeholder: "Enter 6 digit code")
                Text("Code not received? Resend Code !")
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    .font(.caption)
                    .padding(5)
                    .onTapGesture {
                        isGetEmail=true
                        isCodeSent=false
                    }
            }
            CustomButton(action:{
                VerifyPasswordResetCode()
            },buttonName: "Submit",buttonWidth: 200)
            .padding(.top,10)
        }
    }
    func VerifyPasswordResetCode(){
        self.isCodeVerified=true
        self.isCodeSent = false
    }
}
struct SendVerificationCodeForm:View {
    @Binding var isCodeSent : Bool
    @Binding var isGetEmail : Bool
    @State var email:String = ""
    var body: some View {
        VStack{
            TextFieldWithIcon(value: $email, iconName: "person", placeholder: "Enter Email")
            CustomButton(action: {
                SendPasswordResetCode()
            }, buttonName: "Send Code", buttonWidth: 200)
            .padding(.top,10)
        }
    }
    func SendPasswordResetCode(){
        print("setting true")
        self.isCodeSent = true
        self.isGetEmail = false
        print(self.isCodeSent)
    }
}

#Preview {
    ResetPassword()
}
