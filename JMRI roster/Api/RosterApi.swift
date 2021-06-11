//
//  RosterApi.swift
//  JMRI roster
//
//  Created by Tom Homewood - Beam on 09/06/2021.
//

import Foundation
import Alamofire

protocol RosterApi {
    
    func fetchRosterEntries(completion: @escaping (RosterResponse)->())
    
    func fetchRosterEntry(rosterId: String, completion: @escaping (RosterEntryResponse)->())
}

class RosterApiImpl: RosterApi {
    
    let baseUrl = "https://roster.tomstrains.co.uk/api/v1"
    
    func fetchRosterEntries(completion: @escaping (RosterResponse)->()) {
        let request = AF.request(baseUrl + "/roster")
        request.responseDecodable(of: RosterResponse.self) { (response) in
            guard let rosterReponse = response.value else { return }
            completion(rosterReponse)
        }
    }
    
    func fetchRosterEntry(rosterId: String, completion: @escaping (RosterEntryResponse)->()) {
        print("Fetch roster entry for \(rosterId), URL will be \(baseUrl + "/locomotive/" + rosterId)")
        let request = AF.request(baseUrl + "/locomotive/" + rosterId)
        request.responseDecodable(of: RosterEntryResponse.self) { (response) in
            guard let rosterReponse = response.value else { return }
            completion(rosterReponse)
        }
    }
}

protocol RosterApiFactory {
    func rosterApi() -> RosterApi
}

extension RosterApiFactory {
    func rosterApi() -> RosterApi {
        RosterApiImpl()
    }
}
