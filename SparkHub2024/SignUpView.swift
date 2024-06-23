//
//  SignUpView.swift
//  SparkHub2024
//
//  Created by Justin Huang on 6/22/24.
//

import SwiftUI
import Foundation
import KeychainAccess

struct SignUpView: View {
    @EnvironmentObject private var signUpModel: SignUpModel
    @State private var usernamesAndPasswords: [(String, String)] = []
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var hidePassword: Bool = true
    @State private var hidePassText: String = "Show Password"
    @State private var accountFound: Bool = false

    
    var body: some View {
        NavigationStack {
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
                        hidePassword = (hidePassword == true) ? false : true
                        hidePassText = (hidePassText == "Show Password") ? "Hide Password" : "Show Password"
                    }) {
                        Text(hidePassText)
                    }
                    .offset(x: -140, y: -20)
                }
                ZStack {
                    Rectangle()
                        .frame(width: 80, height: 50)
                        .foregroundColor(.blue)
                    Button(action: {
                        guard !signUpModel.usernameExists(username) else {
                            print("Username taken")
                            return
                        }
                        signUpModel.saveInfo(username:username, password:password)
                    }, label: {
                        Text("Sign Up")
                            .foregroundColor(.white)
                    })
                }
                .offset(y: 100)
            }
            .offset(y: -100)
        }
    }
}

#Preview {
    SignUpView()
        .environmentObject(SignUpModel())
}
