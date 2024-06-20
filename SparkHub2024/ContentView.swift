//
//  ContentView.swift
//  SparkHub2024
//
//  Created by Justin Huang on 6/18/24.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State private var bgcolor: Color = .blue
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))

    
    var body: some View {
        ZStack {
            bgcolor.edgesIgnoringSafeArea(.all)
            VStack {
                Text("SparkHub 2024 Hackathon")
                    .font(.system(size: 30))
            }
            
        }
        .offset(CGSize(width: 0, height: -250))
        
        Map(coordinateRegion: $region)
            .frame(width: 400,height: 300)
            
    }
}

#Preview {
    ContentView()
}


