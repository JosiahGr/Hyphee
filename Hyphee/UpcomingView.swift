//
//  UpcomingView.swift
//  Hyphee
//
//  Created by Josiah Green on 1/28/23.
//

import SwiftUI

struct UpcomingView: View {
    
    @State var showingCreateView = false
    var hypheeEvents: [HypheeEvent] = []
    
    var body: some View {
        ScrollView {
            VStack {
                if hypheeEvents.count == 0 {
                    Text("Nothing to look forward to yet. \nAdd an event in the Discover tab to get Hyphee about!")
                        .multilineTextAlignment(.center)
                        .bold()
                    
                } else {
                    ForEach(hypheeEvents) { hypheeEvent in
                        HypheeEventTileView(hypheeEvent: hypheeEvent)
                    }
                }
            }
        }
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
        
        Group {
            
            NavigationView {
                UpcomingView(hypheeEvents: [testHypheeEvent1, testHypheeEvent2])
            }
            
            NavigationView {
                UpcomingView(hypheeEvents: [])
            }
        }
    }
}
