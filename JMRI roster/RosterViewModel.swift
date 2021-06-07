//
//  LocomotivesListViewModel.swift
//  JMRI roster
//
//  Created by Tom Homewood - Beam on 04/06/2021.
//

import Foundation

import Alamofire

final class RosterViewModel: ObservableObject {
    
    @Published var rosterEntries = [RosterEntry]()
    
    init() {
        fetchRosterEntries()
    }
    
    func fetchRosterEntries() {
        let request = AF.request("https://roster.tomstrains.co.uk/api/v1/roster")
        request.responseDecodable(of: RosterResponse.self) { (response) in
            guard let rosterReponse = response.value else { return }
            self.rosterEntries = rosterReponse.rosterEntries
            self.rosterEntries.forEach { (rosterEntry) in
            }
        }
    }
}
