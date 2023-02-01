//
//  DiscoverView.swift
//  Hyphee
//
//  Created by Josiah Green on 2/1/23.
//

import SwiftUI

struct DiscoverView: View {
    
    @ObservedObject var data = DataController.shared
    
    var body: some View {
        HypheeEventListView(HypheeEvents:
            data.discoverHypheeEvents.sorted { $0.date < $1.date }, noEventsText: "Loading events for you!")
            .navigationTitle("Discover")
            .navigationBarItems(trailing:
                                    Button(action: {
                data.getDiscoverEvents()
            }) {
                Image(systemName: "arrow.clockwise")
                    .font(.title2)
            })
    }
}

struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}
