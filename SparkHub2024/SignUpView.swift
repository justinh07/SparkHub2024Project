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
    @EnvironmentObject private var SignupModel: SignUpModel
    @State private var usernamesAndPasswords: [(String, String)] = []
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var hidePassword: Bool = true
    @State private var hidePassText: String = "Show Password"
    @State private var accountFound: Bool = false
    
    
    class SignUpModel: ObservableObject {
        private let keychain = Keychain(service: "com.jhuang.SparkHub2024")
        
        func saveInfo(username: String, password: String) {
            do {
                try keychain
                    .accessibility(.whenUnlocked)
                    .set(password, key: username)
            } catch {
                print("Error")
            }
        }
        func login(username: String, password: String) -> Bool {
            do {
                if let savedPassword = try keychain
                    .accessibility(.whenUnlocked)
                    .get(username) {
                    return password == savedPassword
                } else {
                    return false
                }
            } catch {
                print("Error")
                return false
            }
        }
        func usernameExists(_ username: String) -> Bool {
                do {
                    let password = try keychain
                        .accessibility(.whenUnlocked)
                        .get(username)
                    return password != nil
                } catch {
                    print("Error checking username existence in Keychain: \(error)")
                    return false
                }
            }
        func signIn(username: String, password: String) -> Bool {
            do {
                if let savedPassword = try keychain
                    .accessibility(.whenUnlocked)
                    .get(username) {
                    return password == savedPassword
                } else {
                    return false // Username not found
                }
            } catch {
                print("Error retrieving from Keychain: \(error)")
                return false
            }
        }
        }
    
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
                        guard !SignupModel.usernameExists(username) else {
                            print("Username taken")
                            return
                        }
                        SignupModel.saveInfo(username:username, password:password)
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
}
