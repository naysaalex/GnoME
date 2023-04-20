//
//  GnoMeApp.swift
//  GnoMe
//
//  Created by gnome on 3/11/23.
//

import SwiftUI
import Firebase

@main
struct GnoMeApp: App {
    //@StateObject private var dataController = DataController()
    
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            LoginView()
                //.environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
