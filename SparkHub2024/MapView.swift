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
    
    private var buttonsize: CGFloat = 50
    
    var body: some View {
         
        
        
        
            NavigationStack {
                ZStack {
                    Map {}
                    
                    HStack{
                        Image(systemName: "person.crop.circle")
                            .resizable()
                            .frame(width: buttonsize,height: buttonsize)
                        
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
                                .frame(width: buttonsize,height: buttonsize)
                                .foregroundColor(.black)
                        }
                        .padding(80)

                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .frame(width: buttonsize, height: buttonsize)

                    }
                    
                    .offset(y: 400)
                    
                }

        }
    }
}



#Preview {
    MapView()
}
