//
//  bocaApp.swift
//  boca
//
//  Created by Yuquan Shan on 3/31/24.
//

import SwiftUI

@main
struct bocaApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
