//
//  ContentView.swift
//  SparkHub2024
//
//  Created by Justin Huang on 6/18/24.
//

import SwiftUI

struct ContentView: View {
    @State private var bgcolor: Color = .blue
    var body: some View {
        ZStack {
            bgcolor.edgesIgnoringSafeArea(.all)
            VStack {
                Text("SparkHub 2024 Hackathon")
                    .font(.system(size: 100))
            }
        }
    }
}

#Preview {
    ContentView()
}


