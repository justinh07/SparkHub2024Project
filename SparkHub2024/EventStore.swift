//
//  EventStore.swift
//  SparkHub2024
//
//  Created by Christopher Hsu on 6/22/24.
//
import Foundation
class EventStore {
    static let shared = EventStore() 
    private var events: [Event] = []
    private init() {
        loadEvents()
    }
    func addEvent(_ event: Event) {
        events.append(event)
        saveEvents()
    }
    private func saveEvents() {
        if let encodedEvents = try? JSONEncoder().encode(events) {
            UserDefaults.standard.set(encodedEvents, forKey: "events")
        }
    }
    private func loadEvents() {
        if let savedEventsData = UserDefaults.standard.data(forKey: "events"),
           let decodedEvents = try? JSONDecoder().decode([Event].self, from: savedEventsData) {
            events = decodedEvents
        }
    }
    func getAllEvents() -> [Event] {
        return events
    }
}


