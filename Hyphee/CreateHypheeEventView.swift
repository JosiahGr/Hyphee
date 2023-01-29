//
//  CreateHypheeEventView.swift
//  Hyphee
//
//  Created by Josiah Green on 1/29/23.
//

import SwiftUI

struct CreateHypheeEventView: View {
    
    @StateObject var hypedEvent = HypedEvent()
    
    var body: some View {
        Text("Create Hyphee Event")
    }
}

struct CreateHypheeEventView_Previews: PreviewProvider {
    static var previews: some View {
        CreateHypheeEventView()
    }
}
