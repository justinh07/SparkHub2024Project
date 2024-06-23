//
//  LoginView.swift
//  SparkHub2024
//
//  Created by Justin Huang on 6/21/24.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject private var signUpModel: SignUpModel
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var hidePassword: Bool = true
    @State private var hidePassText: String = "Show Password"
    @State private var loginError: String?
    @State private var loggedIn: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    Text("Username")
                        .font(.system(size: 25))
                        .offset(x: -145, y: 30)
                    ZStack {
                        Rectangle()
                            .stroke(Color.black, lineWidth: 2)
                            .frame(width: 400, height: 50)
                            .opacity(0.3)
                        TextField("Type Here", text: $username)
                            .frame(width: 380, height: 100)
                            .autocorrectionDisabled(true)
                    }
                }
                VStack {
                    Text("Password")
                        .font(.system(size: 25))
                        .offset(x: -150, y: 30)
                    ZStack {
                        Rectangle()
                            .stroke(Color.black, lineWidth: 2)
                            .frame(width: 400, height: 50)
                            .opacity(0.3)
                        if hidePassword {
                            SecureField("Type Here", text: $password)
                                .frame(width: 380, height: 100)
                                .autocorrectionDisabled(true)
                        } else {
                            TextField("Type Here", text: $password)
                                .frame(width: 380, height: 100)
                                .autocorrectionDisabled(true)
                        }
                    }
                    Button(action: {
                        hidePassword.toggle()
                        hidePassText = hidePassword ? "Show Password" : "Hide Password"
                    }) {
                        Text(hidePassText)
                    }
                    .offset(x: -140, y: -20)
                }
                ZStack {
                    Button(action: {
                        attemptLogin()
                    }) {
                        ZStack {
                            Rectangle()
                                .frame(width: 80, height: 50)
                                .foregroundColor(.blue)
                            Text("Log In")
                                .foregroundColor(.white)
                        }
                    }
                }
                .offset(y: 100)
                
                Text(loginError ?? "")
                    .foregroundColor(.red)
                    .font(.system(size: 20))
                    .opacity(loginError != nil ? 1 : 0)
                    .padding(.top, 10)
            }
            .padding()
            .fullScreenCover(isPresented: $loggedIn) {
                MapView()
                    .onDisappear {
                        loggedIn = false
                    }
            }
        }
    }
    
    private func attemptLogin() {
        if signUpModel.signIn(username: username, password: password) {
            signUpModel.loggedInUsername = username
            loggedIn = true
            loginError = nil
        } else {
            loginError = "Incorrect username and/or password"
        }
    }
}

#Preview {
    LoginView()
        .environmentObject(SignUpModel())
}


