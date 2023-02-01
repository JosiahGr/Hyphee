//
//  HypheeEventDetailView.swift
//  Hyphee
//
//  Created by Josiah Green on 2/1/23.
//

import SwiftUI


struct HypheeEventDetailView: View {
    var hypheeEvent: HypheeEvent
    var isDiscover = false
    
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
            
            Text("\(hypheeEvent.timeFromNow().capitalized) on \(hypheeEvent.dateAsString())").font(.title2)
            
            Spacer()
            
            if hypheeEvent.validURL() != nil {
                Button(action: {}) {
                    HypheeEventDetailViewButton(backgroundColor: .orange, imageName: "link", text: "Visit Site")
                }
            }
            
            if isDiscover {
                Button(action: {}) {
                    HypheeEventDetailViewButton(backgroundColor: .blue, imageName: "plus.circle", text: "Add")
                }
            } else {
                Button(action: {}) {
                    HypheeEventDetailViewButton(backgroundColor: .yellow, imageName: "pencil.circle", text: "Edit")
                }
                
                Button(action: {}) {
                HypheeEventDetailViewButton(backgroundColor: .red, imageName: "trash", text: "Delete")
                }
            }
        }
    }
}

struct HypheeEventDetailViewButton: View {
    
    var backgroundColor: Color
    var imageName: String
    var text: String
    
    var body: some View {
        HStack {
            Spacer()
            Image(systemName: imageName)
            Text(text)
            Spacer()
        }
        .font(.title2)
        .padding(12)
        .background(backgroundColor)
        .foregroundColor(.white)
        .cornerRadius(5)
        .padding(.horizontal, 20)
        .padding(.top, 12)
    }
}

struct HypheeEventDetailView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HypheeEventDetailView(hypheeEvent: testHypheeEvent1)
            HypheeEventDetailViewButton(backgroundColor: .orange, imageName: "link", text: "Visit Site")
        }
    }
}
