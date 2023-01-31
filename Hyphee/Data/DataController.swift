//
//  DataController.swift
//  Hyphee
//
//  Created by Josiah Green on 1/31/23.
//

import Foundation

class DataController: ObservableObject {
    static var shared = DataController()
    
    @Published var hypheeEvents: [HypheeEvent] = []
    
    var upcomingHypheeEvents: [HypheeEvent] {
        return hypheeEvents.filter { $0.date > Date().dateAt(.startOfDay) }.sorted { $0.date < $1.date }
    }
    
    var pastHypheeEvents: [HypheeEvent] {
        return hypheeEvents.filter { $0.date < Date().dateAt(.startOfDay) }.sorted { $0.date < $1.date }
    }
    
    func saveData() {
        DispatchQueue.global().async {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(self.hypheeEvents) {
                UserDefaults.standard.setValue(encoded, forKey: "hypheeEvents")
                UserDefaults.standard.synchronize()
            }
        }
    }
    
    func loadData() {
        DispatchQueue.global().async {
            if let data = UserDefaults.standard.data(forKey: "hypheeEvents") {
                let decoder = JSONDecoder()
                if let jsonHypheeEvents = try? decoder.decode([HypheeEvent].self, from: data) {
                    DispatchQueue.main.async {
                        self.hypheeEvents = jsonHypheeEvents
                    }
                }
            }
        }
    }
}
