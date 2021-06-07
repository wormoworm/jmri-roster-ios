//
//  ContentView.swift
//  JMRI roster
//
//  Created by Tom Homewood - Beam on 04/06/2021.
//

import SwiftUI

struct RosterListView: View {
    
    @ObservedObject private(set) var viewModel: RosterViewModel

    var body: some View {
        VStack {
            Button(action: viewModel.fetchRosterEntries) {
                Label("Fetch roster", systemImage: "square.and.arrow.down")
            }
            List {
                ForEach(viewModel.rosterEntries) { rosterEntry in
                    RosterListItemView(rosterEntry: rosterEntry)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RosterListView(viewModel: RosterViewModel())
    }
}
