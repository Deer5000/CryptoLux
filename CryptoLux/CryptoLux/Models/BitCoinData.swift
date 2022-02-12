//
//  CoinManager.swift
//  CryptoLux
//
//  Created by Khidr Brinkley on 2/11/22.
//

import Foundation


struct BitCoinData: Codable {
    let time: [Time]
    let rate: [bpi]
}

//time
struct Time: Codable {
    var updated: [timeStyle]
}

struct timeStyle: Codable {
    var updated: String
}

//rate
struct bpi: Codable {
    var countries: [Country]
}

struct Country: Codable {
    var countryDetails: [Details]
}


struct Details: Codable {
    var rate: String
}






//struct PersonList: Decodable {
//    let persons: [Person]
//
//init(from decoder: Decoder) throws {
//    self.persons = try decoder.singleValueContainer()
//        .decode([String: String].self)
//        .map(Person.init)
//    }
//}

//struct Time: Codable {
//    let updated: String
//}
//
//struct bpi: Codable {
//    let usd: USD
//}
//
//struct USD: Codable {
//    let rate: String
//}

