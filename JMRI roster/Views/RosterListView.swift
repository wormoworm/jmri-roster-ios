//
//  RosterListView.swift
//  JMRI roster
//
//  Created by Tom Homewood - Beam on 08/06/2021.
//

import SwiftUI

struct RosterListView: View {
    
    @ObservedObject private(set) var viewModel: RosterViewModel
    
    var body: some View {
        NavigationView {                
            List(viewModel.rosterEntries) { rosterEntry in
                NavigationLink(destination: RosterEntryView(viewModel: RosterEntryViewModel(rosterId: rosterEntry.id)).navigationTitle(rosterEntry.id)) {
                    RosterListItemView(rosterEntry: rosterEntry)
                }
                .padding(0)
            }.navigationTitle("Roster")
            .padding(0)
        }
        .padding(0)
    }
}

struct RosterListView_Previews: PreviewProvider {
    static var previews: some View {
        RosterListView(viewModel: RosterViewModel())
    }
}
