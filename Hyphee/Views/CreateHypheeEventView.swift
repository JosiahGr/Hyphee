//
//  CreateHypheeEventView.swift
//  Hyphee
//
//  Created by Josiah Green on 1/29/23.
//

import SwiftUI

struct CreateHypheeEventView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @StateObject var hypheeEvent = HypheeEvent()
    @State private var showTime = false
    @State private var showImagePicker = false
    
    var body: some View {
        NavigationView() {
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
                    if hypheeEvent.image() == nil {
                        HStack {
                            FormLabelView(title: "Image", iconSystemName: "camera", color: .purple)
                            
                            Spacer()
                            
                            Button(action: {
                                showImagePicker = true
                            }) {
                                Text("Pick Image")
                            }
                        }
                    } else {
                        HStack {
                            FormLabelView(title: "Image", iconSystemName: "camera", color: .purple)
                            
                            Spacer()
                            
                            Button(action: {
                                hypheeEvent.imageData = nil
                            }) {
                                Text("Remove Image")
                                    .foregroundColor(.red)
                            }
                            .buttonStyle(BorderlessButtonStyle())
                        }
                        Button(action: {
                            showImagePicker = true
                        }) {
                            hypheeEvent.image()!
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                        .buttonStyle(BorderlessButtonStyle())
                    }
                }
                .sheet(isPresented: $showImagePicker) {
                    ImagePicker(imageData: $hypheeEvent.imageData)
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
            
            .navigationBarItems(leading: Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Cancel")
                    .font(.title2)
                    .bold()
            }, trailing: Button(action: {
                DataController.shared.saveHypheeEvent(hypheeEvent: hypheeEvent)
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Done")
                    .font(.title2)
                    .bold()
            })
            .navigationTitle("Create")
        }
    }
}
    
    struct CreateHypheeEventView_Previews: PreviewProvider {
        static var previews: some View {
            CreateHypheeEventView()
        }
    }

