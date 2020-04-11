//
//  ViewController.swift
//  HighLifeUIKit
//
//  Created by Vladyslav Lietun on 10.04.2020.
//  Copyright © 2020 Vladyslav Lietun. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var nature = Bundle.main.decode([Nature].self, from: "examples.json")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Nature"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nature.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let natureOne = nature[indexPath.row]
        
//        cell.imageView?.image = UIImage(named: natureOne.name)
        
        cell.textLabel?.text = natureOne.name
        cell.detailTextLabel?.text = natureOne.location
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = NatureViewController()
        
        detailVC.nature = nature[indexPath.row]
        
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

