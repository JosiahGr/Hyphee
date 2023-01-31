//
//  HypheeEventListView.swift
//  Hyphee
//
//  Created by Josiah Green on 1/31/23.
//

import SwiftUI

struct HypheeEventListView: View {
    
    var HypheeEvents: [HypheeEvent]
    var noEventsText: String
    
    var body: some View {
        ScrollView {
            VStack {
                if HypheeEvents.count == 0 {
                    Text(noEventsText)
                        .multilineTextAlignment(.center)
                        .bold()
                        .padding(.top, 200)
                        .padding(.horizontal, 20)
                    
                } else {
                    ForEach(HypheeEvents) { hypheeEvent in
                        HypheeEventTileView(hypheeEvent: hypheeEvent)
                    }
                }
            }
        }
    }
}

struct HypheeEventListView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HypheeEventListView(HypheeEvents: [testHypheeEvent1, testHypheeEvent2], noEventsText: "No Previous History Yet")
            
            HypheeEventListView(HypheeEvents: [], noEventsText: "No Previous History Yet")
            
        }
    }
}
