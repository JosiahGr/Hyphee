//
//  FormLabelView.swift
//  Hyphee
//
//  Created by Josiah Green on 1/30/23.
//

import SwiftUI

struct FormLabelView: View {
    
    var title: String
    var iconSystemName: String
    var color: Color
    
    var body: some View {
        Label {
            Text(title)
        } icon: {
            Image(systemName: iconSystemName)
                .padding(4)
                .background(color)
                .cornerRadius(7)
                .foregroundColor(.white)
        }
    }
}

struct FormLabelView_Previews: PreviewProvider {
    static var previews: some View {
        FormLabelView(title: "url", iconSystemName: "link", color: .orange)
            .previewLayout(.sizeThatFits)
    }
}
