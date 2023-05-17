//
//  Country.swift
//  Atlas
//
//  Created by Бакдаулет Дуйсенбеков on 16.05.2023.
//

//struct Country: Codable {
//    var name: Name
//    var capital: [String]
//    var population: Int
//    var area: Double?
//    var flags: Flag
//    var currencies: [Currency]
//    var region: String
//    var subregion: String
//    var timezones: [String]
//    var isExpanded: Bool = false // Add this line
//
//    struct Name: Codable {
//        var common: String
//    }
//
//    struct Flag: Codable {
//        var png: String
//    }
//
//    struct Currency: Codable {
//        var name: String?
//    }
//}

import UIKit

struct Country {
    let name: String
    let capital: String
    let flag: UIImage?
    let population: String
    let area: String
    let currencies: String
    var isExpanded: Bool = false
}
