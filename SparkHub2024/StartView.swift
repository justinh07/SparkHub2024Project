//
//  StartView.swift
//  SparkHub2024
//
//  Created by Justin Huang on 6/22/24.
//

import SwiftUI

struct StartView: View {
    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    Rectangle()
                        .frame(width: 200, height: 80)
                        .foregroundColor(.blue)
                    NavigationLink {
                        LoginView()
                            .environmentObject(SignUpModel())
                    } label: {
                        Text("Log-in Page")
                            .foregroundColor(.white)
                            .font(.system(size: 30))
                    }
                }
                    
                ZStack {
                    Rectangle()
                        .frame(width: 200, height: 80)
                        .foregroundColor(.blue)
                    NavigationLink {
                        SignUpView()
                            .environmentObject(SignUpModel())
                    } label: {
                        Text("Sign-up Page")
                            .foregroundColor(.white)
                            .font(.system(size: 30))
                    }
                }
            }
        }
    }
}

#Preview {
    StartView()
}
