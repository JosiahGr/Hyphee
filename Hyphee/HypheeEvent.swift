//
//  HypheeEvent.swift
//  Hyphee
//
//  Created by Josiah Green on 1/29/23.
//

import Foundation
import SwiftUI

class HypheeEvent: ObservableObject {
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
