//
//  HypheeEventTileView.swift
//  Hyphee
//
//  Created by Josiah Green on 1/30/23.
//

import SwiftUI

struct HypheeEventTileView: View {
    
    @ObservedObject var hypheeEvent: HypheeEvent
    
    var body: some View {
        VStack(spacing: 0) {
            if hypheeEvent.image() != nil {
                hypheeEvent.image()!
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            
            Rectangle()
                .foregroundColor(hypheeEvent.color)
                .frame(height: 15)
            HStack {
                Text(hypheeEvent.title)
                    .font(.title)
                    .padding(10)
                Spacer()
            }
            .background(Color.white)
            
            HStack {
                Image(systemName: "calendar")
                    .foregroundColor(.red)
                Text(hypheeEvent.dateAsString())
                Spacer()
                Text(hypheeEvent.timeFromNow())
                Image(systemName: "clock.fill")
                    .foregroundColor(.blue)
            }
            .font(.title3)
            .padding(.horizontal, 10)
            .padding(.bottom, 10)
            .background(Color.white)
        }
        .cornerRadius(15.0)
        .shadow(radius: 10)
        .padding()
    }
}

struct HypheeEventTileView_Previews: PreviewProvider {
    static var previews: some View {
        HypheeEventTileView(hypheeEvent: testHypheeEvent1)
            .previewLayout(.sizeThatFits)
            
    }
}
