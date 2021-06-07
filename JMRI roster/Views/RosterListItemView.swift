//
//  RosterListItemView.swift
//  JMRI roster
//
//  Created by Tom Homewood - Beam on 07/06/2021.
//

import SwiftUI
import NukeUI

struct RosterListItemView: View {
    
    let baseUrl = "https://roster.tomstrains.co.uk/api/v1"
    
    private var rosterEntry: RosterEntry
    
    init(rosterEntry: RosterEntry) {
        self.rosterEntry = rosterEntry
    }
    
    var body: some View {
        HStack {
            LazyImage(source: "\(baseUrl)/locomotive/\(rosterEntry.id)/image/100")
                .scaledToFill()
                .frame(width: 50, height: 50)
                .clipped()
            VStack(alignment: .leading) {
                Text(rosterEntry.id)
                Text(rosterEntry.name ?? "")
            }
        }
    }
}

struct RosterListItemView_Previews: PreviewProvider {
    static var previews: some View {
        let rosterEntry = try! JSONDecoder().decode(RosterEntry.self, from: "{\"id\": \"14701\", \"dccAddress\": \"4701\", \"name\": \"Class 14 no. 701\"}".data(using: .utf8)!)
        RosterListItemView(rosterEntry: rosterEntry)
    }
}
