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

class RosterEntry: Codable, Identifiable {
    
    var id: String
    var dccAddress: String
    var number: String?
    var name: String?
    var manufacturer: String?
    var model: String?
    var owner: String?
    var comment: String?
    var functions: [Function]?
    
    init(id: String, dccAddress: String) {
        self.id = id
        self.dccAddress = dccAddress
    }
    
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

final class Function: Codable, Identifiable {
    var number: Int
    var name: String
    var lockable: Bool
    
    enum CodingKeys: String, CodingKey {
        case number
        case name
        case lockable
    }
}
