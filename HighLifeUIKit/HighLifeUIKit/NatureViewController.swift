//
//  NatureViewController.swift
//  HighLifeUIKit
//
//  Created by Vladyslav Lietun on 11.04.2020.
//  Copyright © 2020 Vladyslav Lietun. All rights reserved.
//

import UIKit

class NatureViewController: UIViewController {
    
    var nature: Nature?

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let nature = nature else {
            fatalError("You must provide nature before showing this view controller.")
        }
        
        title = nature.name
        navigationItem.largeTitleDisplayMode = .never
        view.backgroundColor = .white
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.axis = .vertical
        view.addSubview(stackView)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
