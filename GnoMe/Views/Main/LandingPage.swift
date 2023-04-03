//
//  LandingPage.swift
//  GnoMe
//
//  Created by gnome on 3/11/23.
//

import SwiftUI

struct LandingPage: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct LandingPage_Previews: PreviewProvider {
    static var previews: some View {
        LandingPage()
    }
}
