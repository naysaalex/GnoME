//
//  GnoMeApp.swift
//  GnoMe
//
//  Created by gnome on 3/11/23.
//

import SwiftUI

@main
struct GnoMeApp: App {
    //@StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            WelcomeScreen()
                //.environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
