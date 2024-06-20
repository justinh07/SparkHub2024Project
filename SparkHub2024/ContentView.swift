//
//  ContentView.swift
//  SparkHub2024
//
//  Created by Justin Huang on 6/18/24.
//

import SwiftUI
import MapKit

//struct ContentView: View {
//    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
//
//    
//    var body: some View {
//        ZStack {
//            Map(coordinateRegion: $region)
//                .frame(width: 500,height: 1000)
//            }
//        }
//    }


struct ContentView: View {
    var body: some View {
        MapView()
    }
}

#Preview {
    ContentView()
}


