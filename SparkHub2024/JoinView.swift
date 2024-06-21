//
//  JoinView.swift
//  SparkHub2024
//
//  Created by Justin Huang on 6/20/24.
//

import SwiftUI
import MapKit

struct JoinView: View {
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                Text("Events Nearby")
                    .foregroundColor(.black)
                    .bold()
                    .font(.system(size: 50))
                Rectangle()
                    .frame(width: 350, height: 1)
                    .offset(y: -40)
                    .padding()
                VStack(spacing: 20) {
                    ForEach(0..<3) { index in
                        ZStack {
                            Rectangle()
                                .foregroundColor(.gray)
                                .brightness(0.3)
                                .frame(width: 350, height: 300)
                                .cornerRadius(30)
                                .padding()
                            
                            Text("Beach Clean-Up")
                                .foregroundColor(.black)
                                .font(.system(size: 30))
                                .bold()
                                .offset(y: -100)
                            
                            Rectangle()
                                .frame(width: 300, height: 1)
                                .offset(y: -80)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    JoinView()
}
