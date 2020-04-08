//
//  League.swift
//  CarouselEffect
//
//  Created by Vladyslav Lietun on 08.04.2020.
//  Copyright © 2020 Vladyslav Lietun. All rights reserved.
//

import UIKit

class League {
    var title: String = ""
    var leagueImage: UIImage
    
    init(title: String, leagueImage: UIImage) {
        self.title = title
        self.leagueImage = leagueImage
    }
    
    static func fetchLeagues() -> [League] {
        return [
            League(title: "UEFA Champions League", leagueImage: UIImage(named: "UEFA")!),
            League(title: "Premier League", leagueImage: UIImage(named: "Premier-League")!),
            League(title: "LaLiga", leagueImage: UIImage(named: "LaLiga")!)
        ]
    }
}
