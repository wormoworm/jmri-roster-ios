//
//  RosterEntryView.swift
//  JMRI roster
//
//  Created by Tom Homewood - Beam on 08/06/2021.
//

import SwiftUI
import NukeUI

struct RosterEntryView: View {
    
    let baseUrl = "https://roster.tomstrains.co.uk/api/v1"
    
    @ObservedObject private(set) var viewModel: RosterEntryViewModel
    
    var body: some View {
        VStack {
            LazyImage(source: "\(baseUrl)/locomotive/\(self.viewModel.rosterEntry?.id ?? "66789")/image/1000")
                .contentMode(.aspectFit)
        }.navigationTitle(self.viewModel.rosterEntry!.id)
    }
}

struct RosterEntryView_Previews: PreviewProvider {
    static var previews: some View {
        RosterEntryView(viewModel: RosterEntryViewModel(rosterId: "66957"))
    }
}
