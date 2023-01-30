//
//  HypheeEvent.swift
//  Hyphee
//
//  Created by Josiah Green on 1/29/23.
//

import Foundation
import SwiftUI

class HypheeEvent: ObservableObject, Identifiable {
    var id = UUID().uuidString
    var date = Date()
    var title = ""
    var url = ""
    var color = Color.orange
    @Published var imageData: Data?
    
    func image() -> Image? {
        if let data = imageData {
            if let uiImage = UIImage(data: data) {
                return Image(uiImage: uiImage)
            }
        }
        return nil
    }
    
}

var testHypheeEvent1: HypheeEvent {
    let hypheeEvent = HypheeEvent()
    
    if let image = UIImage(named: "wwdc23") {
        if let data = image.pngData() {
            hypheeEvent.imageData = data
        }
    }
    
    hypheeEvent.title = "WWDC 2024"
    hypheeEvent.color = .green
    hypheeEvent.date = Date()
    hypheeEvent.url = "apple.com"
    
    return hypheeEvent
}

var testHypheeEvent2: HypheeEvent {
    let hypheeEvent = HypheeEvent()
    
    hypheeEvent.title = "Family and Friends Trip to Jackson Hole, Wyoming and then Arizona"
    hypheeEvent.color = .blue
    hypheeEvent.date = Date()
    
    return hypheeEvent
}
