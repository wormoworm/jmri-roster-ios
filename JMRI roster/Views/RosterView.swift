//
//  ContentView.swift
//  JMRI roster
//
//  Created by Tom Homewood - Beam on 04/06/2021.
//

import SwiftUI

struct RosterView: View {
    
    @ObservedObject private(set) var viewModel: RosterViewModel

    var body: some View {
        switch viewModel.state {
        case .loading:
            AppLoadingView()
        case .loaded:
            VStack {
                Button(action: viewModel.fetchRosterEntries) {
                    Label("Fetch roster", systemImage: "square.and.arrow.down")
                }
                RosterListView(viewModel: self.viewModel)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RosterView(viewModel: RosterViewModel())
    }
}
