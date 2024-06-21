//
//  MapView.swift
//  SparkHub2024
//
//  Created by Justin Huang on 6/20/24.
//

import SwiftUI
import MapKit


import SwiftUI
import MapKit

struct MapView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Map {
                    
                }
                Menu {
                    NavigationLink(destination: CreateView()) {
                        Text("Add a New Event")
                    }
                    NavigationLink(destination: JoinView()) {
                        Text("Join an Existing Event")
                    }
                } label: {
                    Image(systemName: "cross.circle")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.black)
                }
                .offset(y: 300)
            }
        }
    }
}



#Preview {
    MapView()
}
