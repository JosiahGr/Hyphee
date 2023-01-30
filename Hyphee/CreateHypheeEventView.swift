//
//  CreateHypheeEventView.swift
//  Hyphee
//
//  Created by Josiah Green on 1/29/23.
//

import SwiftUI

struct CreateHypheeEventView: View {
    
    @StateObject var hypheeEvent = HypheeEvent()
    @State var showTime = false
    
    var body: some View {
        Form {
            Section {
                FormLabelView(title: "Title", iconSystemName: "keyboard", color: .green)
                
                TextField("Family Vacation", text: $hypheeEvent.title)
                    .autocapitalization(.words)
            }
            Section {
                FormLabelView(title: "Date", iconSystemName: "calendar", color: .blue)
                DatePicker("Date", selection: $hypheeEvent.date, displayedComponents: showTime ? [.date, .hourAndMinute] : [.date])
                    .datePickerStyle(GraphicalDatePickerStyle())
                Toggle(isOn: $showTime) {
                    FormLabelView(title: "Time", iconSystemName: "clock.fill", color: .blue)
                }
            }
            
            Section {
                ColorPicker(selection: $hypheeEvent.color) {
                    FormLabelView(title: "Color", iconSystemName: "eyedropper", color: .yellow)
                }            }
            
            Section {
                FormLabelView(title: "URL", iconSystemName: "link", color: .orange)
                TextField("Nintendo.com", text: $hypheeEvent.url)
                    .keyboardType(.URL)
                    .autocapitalization(.none)
            }
        }
    }
}

struct CreateHypheeEventView_Previews: PreviewProvider {
    static var previews: some View {
        CreateHypheeEventView()
    }
}
