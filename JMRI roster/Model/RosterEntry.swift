//
//  Locomotive.swift
//  JMRI roster
//
//  Created by Tom Homewood - Beam on 04/06/2021.
//

import Foundation

final class RosterResponse: Decodable {
    let rosterEntries: [RosterEntry]
    
    enum CodingKeys: String, CodingKey {
        case rosterEntries = "locomotives"
    }
}

final class RosterEntryResponse: Decodable {
    let rosterEntry: RosterEntry
    
    enum CodingKeys: String, CodingKey {
        case rosterEntry = "locomotive"
    }
}

final class RosterEntry: Decodable, Identifiable {
    
    let id: String
    let dccAddress: String
    let name: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case dccAddress = "dccAddress"
        case name = "title"
    }
}
