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
        GeometryReader { geometry in
            ScrollView(.vertical){
                Unwrap(self.viewModel.rosterEntry) { rosterEntry in
                    LazyVStack(alignment: .leading, spacing: 16) {
                        LazyImage(source: "\(baseUrl)/locomotive/\(rosterEntry.id)/image/1000")
                            .contentMode(.aspectFill)
                            .frame(width: geometry.size.width, height: geometry.size.width / 16 * 9)
                        LazyVStack(alignment: .leading, spacing: 0) {
                            Text("Locomotive info")
                                .style(TextStyleContentBlockTitle())
                            Text("Name")
                                .style(TextStyleFieldLabel())
                            Text(rosterEntry.name ?? "-")
                                .style(TextStyleField())
                            Text("DCC address")
                                .style(TextStyleFieldLabel())
                            Text(rosterEntry.dccAddress)
                                .style(TextStyleField())
                        }
                        .frame(maxWidth: .infinity)
                        .style(StyleContentBlock())
                        if rosterEntry.comment != nil {
                            LazyVStack(alignment: .leading, spacing: 0) {
                                Text("Comments")
                                    .style(TextStyleContentBlockTitle())
                                Text(rosterEntry.comment ?? "-")
                                    .style(TextStyleField())
                            }
                            .style(StyleContentBlock())
                        }
                        if rosterEntry.hasFunctions() {
                            RosterEntryFunctionsView(functions: rosterEntry.functions!)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .onAppear(perform: viewModel.fetchRosterEntry)
            }
        }
    }
}

struct RosterEntryFunctionsView: View {
    
    private(set) var functions: [Function]
    
    var body: some View {
        LazyVStack(alignment: .leading, spacing: 0) {
            Text("Functions")
                .style(TextStyleContentBlockTitle())
            List(self.functions) { function in
                Text(function.name)
            }
        }
        .style(StyleContentBlock())
    }
}

struct RosterEntryView_Previews: PreviewProvider {
    static var previews: some View {
        RosterEntryView(viewModel: RosterEntryViewModel(rosterId: "66957"))
    }
}
