//
//  MapView.swift
//  SparkHub2024
//
//  Created by Justin Huang on 6/20/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State private var searchText = ""
    @State private var mapItems = [IdentifiableMKMapItem]()
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    
    private var buttonSize: CGFloat = 60
    private var buttonColor: Color = .white
    
    var body: some View {
        NavigationStack {
            ZStack {
                Map(coordinateRegion: $region, annotationItems: mapItems) { item in
                    MapPin(coordinate: item.mapItem.placemark.coordinate, tint: .red)
                }
                .edgesIgnoringSafeArea(.all)
                
                VStack {
                    SearchBar(text: $searchText, onSearchButtonClicked: search)
                        .padding(10)
                        .background(Color.white)
                        .cornerRadius(8)
                        .shadow(radius: 4)
                        .padding(.horizontal)
                        .frame(width: 450)

                    
                    Spacer()
                }
                .padding(.top, 5)
                ZStack{
                    Rectangle()
                        .offset(y:750)
                        .opacity(0.4)
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            
                            HStack(spacing: 20) {
                                NavigationLink(destination: ProfileView()) {
                                    Image(systemName: "person.crop.circle")
                                        .resizable()
                                        .frame(width: buttonSize, height: buttonSize)
                                        .foregroundColor(buttonColor)
                                }
                                .padding(100)
                                NavigationLink(destination: CreateView()) {
                                    Image(systemName: "plus.circle")
                                        .resizable()
                                        .frame(width: buttonSize, height: buttonSize)
                                        .foregroundColor(buttonColor)
                                }
                                .padding(100)
                            }
                            .offset(y: 100)
                        }
                    }
                }
                
            }
        }
    }
    
    private func search() {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchText
        
        let search = MKLocalSearch(request: request)
        search.start { response, error in
            guard let response = response else {
                print("Search error: \(String(describing: error))")
                return
            }
            
            mapItems = response.mapItems.map { IdentifiableMKMapItem(mapItem: $0) }
            if let firstItem = mapItems.first {
                region.center = firstItem.mapItem.placemark.coordinate
            }
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
