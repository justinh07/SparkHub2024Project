//
//  SparkHub2024App.swift
//  SparkHub2024
//
//  Created by Justin Huang on 6/18/24.
//  CH first commit test

import SwiftUI

@main

struct SparkHub2024App: App {
    @State private var signUpModel = SignUpModel()
    
    var body: some Scene {
        WindowGroup {
            StartView()
                .environmentObject(signUpModel)
        }
    }
}
