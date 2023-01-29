//
//  UpcomingView.swift
//  Hyphee
//
//  Created by Josiah Green on 1/28/23.
//

import SwiftUI

struct UpcomingView: View {
    
    @State var showingCreateView = false
    
    var body: some View {
        Text("Upcoming")
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
        NavigationView {
            UpcomingView()
        }
    }
}
