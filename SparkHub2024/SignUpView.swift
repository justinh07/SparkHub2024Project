//
//  SignUpView.swift
//  SparkHub2024
//
//  Created by Justin Huang on 6/22/24.
//

import SwiftUI

struct SignUpView: View {
    @State private var name: String = ""
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
                        TextField("Type Here", text: $name)
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
                    NavigationLink(destination: MapView().navigationBarBackButtonHidden(true)) {
                        Text("Submit")
                            .foregroundColor(.white)
                    }
                }
                .offset(y: 100)

                Text("Incorrect Username and/or Password")
                    .foregroundColor(.red)
                    .offset(y: 110)
                    .font(.system(size: 20))
                    .opacity((accountFound) ? 0 : 1)
            }
            .offset(y: -100)
        }
    }
}


#Preview {
    SignUpView()
}
