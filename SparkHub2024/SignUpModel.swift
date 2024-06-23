//
//  SignUpModel.swift
//  SparkHub2024
//
//  Created by Justin Huang on 6/22/24.
//

import SwiftUI
import KeychainAccess

class SignUpModel: ObservableObject {
    private let keychain = Keychain(service: "com.jhuang.SparkHub2024")
    @Published var loggedInUsername: String?
    
    func saveInfo(username: String, password: String) {
        do {
            try keychain
                .accessibility(.whenUnlocked)
                .set(password, key: username)
        } catch {
            print("Error")
        }
    }
    func usernameExists(_ username: String) -> Bool {
            do {
                let password = try keychain
                    .accessibility(.whenUnlocked)
                    .get(username)
                return password != nil
            } catch {
                print("Error")
                return false
            }
        }
    func signIn(username: String, password: String) -> Bool {
            do {
                if let savedPassword = try keychain
                    .accessibility(.whenUnlocked)
                    .get(username) {
                    if password == savedPassword {
                        loggedInUsername = username
                        return true
                    } else {
                        return false
                    }
                } else {
                    return false 
                }
            } catch {
                print("Error")
                return false
            }
        }
}

