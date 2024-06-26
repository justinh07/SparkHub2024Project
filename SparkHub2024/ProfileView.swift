//
//  ProfileView.swift
//  SparkHub2024
//
//  Created by Christopher Hsu on 6/20/24.
//

import SwiftUI

struct ProfileView: View {
    @State private var karmaColor: Color = .green
    @EnvironmentObject private var signUpModel: SignUpModel

    var body: some View {
        NavigationStack {
            VStack {
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .padding()
                    .foregroundColor(.black)
                Text(signUpModel.loggedInUsername ?? "Unknown User")
                    .foregroundColor(.black)
                    .font(.system(size: 30))
                    .padding()
                VStack {
                    Text("1000")
                        .font(Font.system(size:60, design: .default))
                        .foregroundColor(karmaColor)
                    Text("Karma")
                        .font(.system(size: 30))
                        .foregroundColor(.black)
                    }
                .offset(y:50)
                Menu {
                    Button("Cancel") {}
                    NavigationLink("Confirm Log Out") {
                        StartView()
                            .navigationBarBackButtonHidden(true)
                    }
                } label: {
                    Text("Log Out")
                        .font(.system(size: 20))
                }
                .offset(y: 280)
            }
            .offset(y: -100)
        }
    }
}

#Preview {
    ProfileView()
        .environmentObject(SignUpModel())
}
