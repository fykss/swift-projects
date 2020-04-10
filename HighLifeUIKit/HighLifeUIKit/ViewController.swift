//
//  ViewController.swift
//  HighLifeUIKit
//
//  Created by Vladyslav Lietun on 10.04.2020.
//  Copyright © 2020 Vladyslav Lietun. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, DataApiMangerDelegate {

    var dataApiManager = DataApiManger()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataApiManager.delegate = self
        
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Countries"
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        return cell
    }
    
    func didUpdateData(dataApi: DataApi) {
        print(dataApi.api.results)
    }
}


