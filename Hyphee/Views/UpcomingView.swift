//
//  UpcomingView.swift
//  Hyphee
//
//  Created by Josiah Green on 1/28/23.
//

import SwiftUI

struct UpcomingView: View {
    
    @State var showingCreateView = false
    @ObservedObject var data = DataController.shared
    
    var body: some View {
        HypheeEventListView(HypheeEvents: data.upcomingHypheeEvents, noEventsText: "Create an event or check out the Discover tab!")
        .navigationTitle("Upcoming")
        .navigationBarItems(trailing:
                                Button(action: {
            showingCreateView = true
        }) {
            Image(systemName: "calendar.badge.plus")
                .font(.title2)
        }
            .sheet(isPresented: $showingCreateView) {
                CreateHypheeEventView()
            }
        )}
}

struct UpcomingView_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingView()
    }
}
