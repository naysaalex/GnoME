//
//  LandingPage.swift
//  GnoMe
//
//  Created by gnome on 3/11/23.
//

import SwiftUI

struct LandingPage: View {
    var body: some View {
        TabView{
            Text("Recent Post's")
                .tabItem {
                    Image(systemName: "rectangle.stack")
                    Text("Post's")
                }
            ProfileView()
                .tabItem {
                    Image(systemName: "person.circle.fill")
                    Text("Profile")
                }
        }
        .tint(.black)
    }
}

struct LandingPage_Previews: PreviewProvider {
    static var previews: some View {
        LandingPage()
    }
}
