//
//  Data.swift
//  HighLifeUIKit
//
//  Created by Vladyslav Lietun on 10.04.2020.
//  Copyright © 2020 Vladyslav Lietun. All rights reserved.
//

import Foundation

struct DataApi: Decodable {
    let api: Results
}

struct Results: Decodable {
    let results: Int
    let countries: [Country]
}

struct Country: Decodable {
    let country: String
    let code: String?
}
