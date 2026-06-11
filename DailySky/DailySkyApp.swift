//
//  DailySkyApp.swift
//  DailySky
//
//  Created by Eyad waleed on 05/06/2026.
//

import SwiftUI

@main
struct DailySkyApp: App {
    private let container = DIContainer.shared


    var body: some Scene {
        WindowGroup {
            HomeView() .environment(
                \.managedObjectContext,container.coreDataController.container.viewContext )
              
        }
    }
}
