//
//  DescriptionView.swift
//  SparkHub2024
//
//  Created by Justin Huang on 6/22/24.
//


import SwiftUI

struct DescriptionView: View {
    var event: EventInformation
    
    private static var dateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateStyle = .short
        return df
    }()
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(event.name)
                .font(.headline)
            Text(event.description)
                .font(.subheadline)
            Text("Time: \(event.time)")
            Text("Capacity: \(event.capacity)")
            Text("Date: \(Self.dateFormatter.string(from: event.date))")
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}
