//
//  PastView.swift
//  Hyphee
//
//  Created by Josiah Green on 1/31/23.
//

import SwiftUI

struct PastView: View {
    @ObservedObject var data = DataController.shared
    
    var body: some View {
        HypheeEventListView(HypheeEvents: data.pastHypheeEvents, noEventsText: "No events have passed yet.")
        .navigationTitle("Past Events")
    }
}

struct PastView_Previews: PreviewProvider {
    static var previews: some View {
        PastView()
    }
}
