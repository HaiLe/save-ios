//
//  saveApp.swift
//  save
//
//  Created by Hai Le on 7/14/23.
//

import SwiftUI

@main
struct saveApp: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
