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
        
//        navigationItem.largeTitleDisplayMode = .never
        view.backgroundColor = .white
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.axis = .vertical
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
        
//        let image = UIImage(named: nature.name)
//        let imageView = UIImageView(image: image!)
//        imageView.contentMode = UIView.ContentMode.scaleAspectFit
//        imageView.frame.size.width = 200
//        imageView.frame.size.height = 200
//        imageView.center = self.view.center
        
//        let name = UILabel()
//        name.font = UIFont.preferredFont(forTextStyle: .title1)
//        name.textAlignment = .center
//        name.text = nature.name
        
        let location = UILabel()
        location.font = UIFont.preferredFont(forTextStyle: .headline)
//        location.textAlignment = .center
        location.textColor = .secondaryLabel
        location.text = nature.location
        
        let locationWrapper = UIView()
        location.translatesAutoresizingMaskIntoConstraints = false
        locationWrapper.addSubview(location)
        
        NSLayoutConstraint.activate([
            location.topAnchor.constraint(equalTo: locationWrapper.topAnchor),
            location.bottomAnchor.constraint(equalTo: locationWrapper.bottomAnchor),
            location.leadingAnchor.constraint(equalTo: locationWrapper.leadingAnchor, constant: 20)
        ])
        
        let description = UILabel()
        description.text = nature.description
        description.numberOfLines = 0
        
        let descriptionWrapper = UIView()
        description.translatesAutoresizingMaskIntoConstraints = false
        descriptionWrapper.addSubview(description)
        
        NSLayoutConstraint.activate([
            description.topAnchor.constraint(equalTo: descriptionWrapper.topAnchor),
            description.bottomAnchor.constraint(equalTo: descriptionWrapper.bottomAnchor),
            description.leadingAnchor.constraint(equalTo: descriptionWrapper.leadingAnchor, constant: 20),
            description.trailingAnchor.constraint(equalTo: descriptionWrapper.trailingAnchor, constant: -20)
        ])
        
        let buy = UIButton(type: .custom)
        buy.setTitle("Buy for \(nature.cost) credits", for: .normal)
        buy.addTarget(self, action: #selector(buyVoucher), for: .touchUpInside)
        buy.backgroundColor = UIColor.purple
        buy.setTitleColor(.white, for: .normal)
        buy.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        buy.contentEdgeInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        buy.layer.cornerRadius = 30
        
        let buyWrapper = UIView()
        buy.translatesAutoresizingMaskIntoConstraints = false
        buyWrapper.addSubview(buy)
        
        NSLayoutConstraint.activate([
            buy.topAnchor.constraint(equalTo: buyWrapper.topAnchor),
            buy.bottomAnchor.constraint(equalTo: buyWrapper.bottomAnchor),
            buy.centerXAnchor.constraint(equalTo: buyWrapper.centerXAnchor)
        ])
        
//        stackView.addArrangedSubview(imageView)
//        stackView.addArrangedSubview(name)
        stackView.addArrangedSubview(locationWrapper)
        stackView.addArrangedSubview(descriptionWrapper)
        stackView.addArrangedSubview(buyWrapper)
        
//        stackView.setCustomSpacing(10, after: name)
        stackView.setCustomSpacing(20, after: locationWrapper)
        stackView.setCustomSpacing(20, after: descriptionWrapper)
    }
    
    @objc func buyVoucher() {
        let ac = UIAlertController(title: "It's yours!", message: "Please send the cash", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Buy", style: .default))
        present(ac, animated: true)
    }
}


