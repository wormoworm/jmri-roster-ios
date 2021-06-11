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
        ScrollView(.vertical){
            GeometryReader { geometry in
                VStack(alignment: .leading) {
                    Unwrap(self.viewModel.rosterEntry) { rosterEntry in
                        LazyImage(source: "\(baseUrl)/locomotive/\(rosterEntry.id)/image/1000")
                            .contentMode(.aspectFill)
                            .frame(width: geometry.size.width, height: geometry.size.width / 16 * 9)
                        VStack(alignment: .leading) {
                            Text("Locomotive info")
                            Text("Name")
                            Text(rosterEntry.name ?? "-")
                                .fixedSize(horizontal: false, vertical: true)
                            Text("DCC address")
                            Text(rosterEntry.dccAddress)
                        }
                        .padding(10)
                        .frame(maxWidth: .infinity)
                        .background(Color.gray)
                        if rosterEntry.comment != nil {
                            VStack(alignment: .leading) {
                                Text("Comments")
                                Text(rosterEntry.comment ?? "-")
                                    .fixedSize(horizontal: false, vertical: true)
                            }
                            .padding(10)
                        }
                        if rosterEntry.hasFunctions() {
                            RosterEntryFunctionsView(functions: rosterEntry.functions!)
                            .padding(10)
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
        VStack(alignment: .leading) {
            Text("Functions")
            List(self.functions) { function in
                Text(function.name)
            }
        }
    }
}

struct RosterEntryView_Previews: PreviewProvider {
    static var previews: some View {
        RosterEntryView(viewModel: RosterEntryViewModel(rosterId: "66957"))
    }
}
