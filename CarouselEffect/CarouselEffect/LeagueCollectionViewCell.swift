//
//  LeagueCollectionViewCell.swift
//  CarouselEffect
//
//  Created by Vladyslav Lietun on 08.04.2020.
//  Copyright © 2020 Vladyslav Lietun. All rights reserved.
//

import UIKit

class LeagueCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var leagueImageView: UIImageView!
    @IBOutlet weak var leagueLabel: UILabel!
    
    var league: League! {
        didSet {
            self.updateUI()
        }
    }
    
    func updateUI() {
        if let league = league {
            leagueImageView.image = league.leagueImage
            leagueLabel.text = league.title
        } else {
            leagueImageView.image = nil
            leagueLabel.text = nil
        }
        
        leagueImageView.layer.cornerRadius = 10.0
        leagueImageView.layer.masksToBounds = true
    }
}
