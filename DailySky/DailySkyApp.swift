//
//  DailySkyApp.swift
//  DailySky
//
//  Created by Eyad waleed on 05/06/2026.
//

import SwiftUI

@main
struct DailySkyApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
