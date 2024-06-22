//
//  Event.swift
//  SparkHub2024
//
//  Created by Christopher Hsu on 6/22/24.
//
import Foundation
struct Event: Codable, Identifiable{
    let id: String
    let title: String
    let description: String
    let eventdate: TimeInterval
    var capacity: Int
    let host: String
    let latitude: Double // New property for latitude
    let longitude: Double // New property for longitude
    
    mutating func morepeople(by people: Int) {
        self.capacity += people
    }
}
