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
}
