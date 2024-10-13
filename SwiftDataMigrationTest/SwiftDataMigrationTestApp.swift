//
//  SwiftDataMigrationTestApp.swift
//  SwiftDataMigrationTest
//
//  Created by Sean Conrad on 10/8/24.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataMigrationTestApp: App {
    var sdManager: SwiftDataManager = SwiftDataManager.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sdManager.modelContainer)
    }
}
