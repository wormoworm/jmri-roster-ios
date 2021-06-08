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
    let number: String?
    let name: String?
    let manufacturer: String?
    let model: String?
    let owner: String?
    let comment: String?
    let functions: [Function]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case dccAddress
        case number
        case name
        case manufacturer
        case model
        case owner
        case comment
        case functions
    }
    
    func hasName() -> Bool {
        return !(name ?? "").isEmpty
    }
    
    func getFunctionCount() -> Int {
        return functions?.count ?? 0
    }
    
    func hasFunctions() -> Bool {
        return getFunctionCount() > 0
    }
}

final class Function: Decodable {
    let number: Int
    let name: String
    let lockable: Bool
    
    enum CodingKeys: String, CodingKey {
        case number
        case name
        case lockable
    }
}
