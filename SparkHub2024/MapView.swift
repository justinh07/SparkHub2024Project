//
//  MapView.swift
//  SparkHub2024
//
//  Created by Justin Huang on 6/20/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    private var buttonsize: CGFloat = 50
    private var buttoncolor: Color = .white
    
    var body: some View {
        
            NavigationStack {
                ZStack {
                    Map {}
                    
                    Rectangle()
                        .opacity(0.7)
                        .offset(y:775)
                    
                    HStack{
                        NavigationLink {
                                ProfileView()
                            } label: {
                                Image(systemName: "person.crop.circle")
                                    .resizable()
                                    .frame(width: buttonsize,height: buttonsize)
                                    .foregroundColor(buttoncolor)
                                    .offset(y: -3)
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
                                .frame(width: buttonsize,height: buttonsize)
                                .foregroundColor(buttoncolor)
                        }
                        .offset(y:15)
                        .padding(80)
                            NavigationLink {
                                    SearchView()
                                } label: {
                                    Image(systemName: "magnifyingglass")
                                        .resizable()
                                        .frame(width: buttonsize, height: buttonsize)
                                        .foregroundColor(buttoncolor)
                                }
                    }
                    
                    .offset(y: 400)
                    
                }

        }
    }
}



#Preview {
    MapView()
}
