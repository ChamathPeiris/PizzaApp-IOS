//
//  PizzaApp.swift
//  Pizza
//
//  Created by Chamath Peiris on 2022-05-08.
//

import SwiftUI

@main
struct PizzaApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
