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
    let capacity: Int
}
