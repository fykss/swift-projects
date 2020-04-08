//
//  LeaguesViewContoller.swift
//  CarouselEffect
//
//  Created by Vladyslav Lietun on 08.04.2020.
//  Copyright © 2020 Vladyslav Lietun. All rights reserved.
//

import UIKit

class LeaguesViewContoller: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    var leagues = League.fetchLeagues()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
    }
}

// MARK: - UICollectionViewDataSource

extension LeaguesViewContoller: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return leagues.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LeagueCollectionViewCell", for: indexPath) as! LeagueCollectionViewCell
        
        let league = leagues[indexPath.item]
        
        cell.league = league
        
        return cell
    }
    
}
