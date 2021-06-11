//
//  RosterEntryViewModel.swift
//  JMRI roster
//
//  Created by Tom Homewood - Beam on 08/06/2021.
//

import Foundation
import Alamofire

final class RosterEntryViewModel: ObservableObject, RosterApiFactory {
    
    @Published var state: LoadingState = .loading
    @Published var rosterEntry: RosterEntry?
    
    private(set) var rosterId: String
    
    init(rosterId: String) {
        self.rosterId = rosterId
    }
    
    func fetchRosterEntry() {
        rosterApi().fetchRosterEntry(rosterId: rosterId) { rosterResponse in
            print("Response, roster ID = \(rosterResponse.rosterEntry.id)")
            self.rosterEntry = rosterResponse.rosterEntry
            self.state = .loaded
        }
    }
}
