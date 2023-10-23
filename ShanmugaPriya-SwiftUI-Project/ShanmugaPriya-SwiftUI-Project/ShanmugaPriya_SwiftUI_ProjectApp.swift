//
//  ShanmugaPriya_SwiftUI_ProjectApp.swift
//  ShanmugaPriya-SwiftUI-Project
//
//  Created by Shanmuga Priya M on 10/10/23.
//

import SwiftUI
import LocalAuthentication

@main
struct ShanmugaPriya_SwiftUI_ProjectApp: App {
    @AppStorage("loggedIn") var loggedIn : Bool = false
    @StateObject private var isFirstTime = AppState()
    @State private var isUnlocked = false
    var body: some Scene {
        WindowGroup {
            VStack{
                if isUnlocked {
                    if loggedIn {
                        HomeView()
                    }
                    else {
                        LoginView(email: "", password: "")
                            .environmentObject(isFirstTime)
                    }
                } 
                else {
                    Text("Locked")
                    Button("face id"){
                        authenticate()
                    }
                }
            }.onAppear(perform: {
                authenticate()
            })
            
//            ThreadingView()
//            HomeView()
        }
        
    }
    func authenticate() {
        print("calling auth fn")
        let context = LAContext()
        var error: NSError?

        // check whether biometric authentication is possible
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            // it's possible, so go ahead and use it
            let reason = "We need to unlock your data."
print("before if")
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                // authentication has now completed
                if success {
                    print("success")
                    // authenticated successfully
                    isUnlocked=true
                    
                } else {
                    print("failed")
                    // there was a problem
                }
            }
        } else {
            print("no bio")
            // no biometrics
        }
    }

}
