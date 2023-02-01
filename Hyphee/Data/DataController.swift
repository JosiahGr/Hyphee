//
//  DataController.swift
//  Hyphee
//
//  Created by Josiah Green on 1/31/23.
//

import Foundation
import SwiftDate
import UIColorHexSwift
import SwiftUI

class DataController: ObservableObject {
    static var shared = DataController()
    
    @Published var hypheeEvents: [HypheeEvent] = []
    @Published var discoverHypheeEvents: [HypheeEvent] = []
    
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
    
    func getDiscoverEvents() {
        if let url = URL(string: "https://api.npoint.io/5a4852be518d2984df3e") {
            let request = URLRequest(url: url)
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let webData = data {
                   if let json = try? JSONSerialization.jsonObject(with: webData, options: []) as?
                        [[String:String]] {
                       
                       var hypheeEventsToAdd: [HypheeEvent] = []
                       
                       for jsonHypheeEvent in json {
                           let hypheeEvent = HypheeEvent()
                           if let id = jsonHypheeEvent["id"] {
                               hypheeEvent.id = id
                           }
                          if let dateString = jsonHypheeEvent["date"] {
                               if let dateInRegion = dateString.toDate() {
                                   hypheeEvent.date = dateInRegion.date
                               }
                           }
                           if let title = jsonHypheeEvent["title"] {
                               hypheeEvent.title = title
                           }
                           if let url = jsonHypheeEvent["url"] {
                               hypheeEvent.url = url
                           }
                           if let colorHex = jsonHypheeEvent["color"] {
                               hypheeEvent.color = Color(UIColor("#" + colorHex))
                           }
                           if let imageURL = jsonHypheeEvent["imageURL"] {
                               if let url = URL(string: imageURL) {
                                   
                                   // downloads image
                                   if let data = try? Data(contentsOf: url) {
                                       hypheeEvent.imageData = data
                                   }
                               }

                           }
                           hypheeEventsToAdd.append(hypheeEvent)
                       }
                       DispatchQueue.main.async {
                           self.discoverHypheeEvents = hypheeEventsToAdd
                       }
                       
                   }
                }
            }.resume()
        }
    }
}
