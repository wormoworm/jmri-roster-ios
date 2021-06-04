//
//  JMRI_rosterApp.swift
//  JMRI roster
//
//  Created by Tom Homewood - Beam on 04/06/2021.
//

import SwiftUI

@main
struct JMRI_rosterApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            RosterListView(viewModel: RosterViewModel())
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
