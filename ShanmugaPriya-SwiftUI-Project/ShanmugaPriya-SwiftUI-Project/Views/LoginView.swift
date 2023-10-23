//
//  LoginPage.swift
//  ShanmugaPriya-SwiftUI-Project
//
//  Created by Shanmuga Priya M on 10/10/23.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject private var appState: AppState
    @State var email:String
    @State var password:String
    @State private var isPasswordVisible: Bool = false
    @State var  isLoggedIn:Bool = false
    @State var isBusy:Bool = false
    @ObservedObject var network = NetworkMonitor()
    var body: some View {
        NavigationView{
            if(isBusy){
                BusyView(message: Messages.Authenticating)
            }else{
                if(appState.isFirstTime){
                    SplashScreen()
                }
                else{
                    ZStack{
                        BackgroundView()
                        VStack(spacing:30){
                            Image("login")
                                .resizable()
                                .frame(width: 300,height: 300)
                            
                            VStack(alignment: .leading, spacing: 15){
                                Text("Welcome Back !").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                Text("Login and enter the community ").padding(.bottom,10)
                                TextFieldWithIcon(value: $email, iconName : "envelope",placeholder: Placeholder.Email)
                                PasswordFieldWithIcon(isPasswordVisible:isPasswordVisible,value: $password,placeholder: Placeholder.Password)
                                
                                NavigationLink(destination: ResetPassword() ){
                                    Text("Forgot Password ? Reset Now !").font(.footnote)
                                        .padding(.leading,10)
                                        .padding(.top,0)
                                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                                }
                                
                            }
                            VStack{
                                CustomButton(action:{
                                    Login()
                                },buttonName: Labels.Login, buttonWidth: 200)
                                NavigationLink(destination: RegistrationView() ){
                                    Text("New to PeopleCue? Register Now").font(.caption)
                                }
                                .navigationBarBackButtonHidden(true)
                            }
                        }.padding(20)
                    }
                   
                }
            }
           
            
        }
        .navigationBarBackButtonHidden()
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                appState.isFirstTime = false
            }
        }
    }
    func Login(){
        print("entered login func")
        guard let loginUrl = URL(string:"\(WebConstants.BaseUrl)\(WebConstants.Login)")
        else{
            fatalError()
        }
        
        var loginRequest = URLRequest(url:loginUrl)
        loginRequest.httpMethod = "POST"
        loginRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let bodyParams = LoginParams(email: email, password: password)
        loginRequest.httpBody = try? JSONEncoder().encode(bodyParams)
        //initiate req
        isBusy = true
        URLSession.shared.dataTask(with: loginRequest){
            data,response,error in print("response from login request")
            isBusy = false
            guard let data = data, error == nil else{
                print(error?.localizedDescription)
                return
            }
            if let httpStatus =  response as? HTTPURLResponse, httpStatus.statusCode == 200{
                UserDefaults.standard.setValue(true, forKey: "loggedIn")
                DispatchQueue.main.async {
                    print("extracted data")
                    self.extractData(data)
                }
                
            }
        }.resume()
        }
    private func extractData(_ data: Data){
//        print(responseData!["token"])
        let responseData = try? JSONDecoder().decode(LoginResponse.self, from: data)
        UserDefaults.standard.setValue(responseData!.token, forKey: AppKeys.Token)
        print(NSHomeDirectory())
        print(responseData?.token ?? "NO Token ")
    }
        //fetch userName Password and approve or disapprove login
}
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        let appState = AppState()

        return LoginView(email: "", password: "")
            .environmentObject(appState)
    }
}

#Preview {
    LoginView_Previews.previews
}
