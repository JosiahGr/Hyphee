//
//  HypheeTabView.swift
//  Hyphee
//
//  Created by Josiah Green on 1/28/23.
//

import SwiftUI

struct HypheeTabView: View {
    var body: some View {
        TabView {
            NavigationView {
                UpcomingView()
            }
            .tabItem {
                Image(systemName:"calendar")
                Text("Upcoming")
            }
            Text ("Hello 2")
                .tabItem {
                    Image(systemName:"magnifyingglass")
                    Text("Discover")
                }
            NavigationView {
                PastView()
            }
                .tabItem {
                    Image(systemName:"gobackward")
                    Text("History")
                }
        }
    }
}

struct HypheeTabView_Previews: PreviewProvider {
    static var previews: some View {
        HypheeTabView()
    }
}
