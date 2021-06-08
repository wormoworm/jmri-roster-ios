//
//  RosterEntryViewModel.swift
//  JMRI roster
//
//  Created by Tom Homewood - Beam on 08/06/2021.
//

import Foundation
import Alamofire

final class RosterEntryViewModel: ObservableObject {
    
    @Published var state: LoadingState = .loading
    @Published var rosterEntry: RosterEntry?
    
    init(rosterId: String) {
        fetchRosterEntry(rosterId: rosterId)
    }

    func fetchRosterEntry(rosterId: String) {
        let request = AF.request("https://roster.tomstrains.co.uk/api/v1/locomotive/\(rosterId)")
        request.responseDecodable(of: RosterEntryResponse.self) { (response) in
            guard let rosterReponse = response.value else { return }
            self.rosterEntry = rosterReponse.rosterEntry
            self.state = .loaded
        }
    }
}
