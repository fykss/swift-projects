//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Vladyslav Lietun on 21.03.2020.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    var bmiValue: String?
    var bmiAdvice: String?
    var bmiColor: UIColor?
    
    @IBOutlet weak var BMILabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    @IBOutlet weak var resultBackground: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        BMILabel.text = bmiValue
        adviceLabel.text = bmiAdvice
        resultBackground.backgroundColor = bmiColor
    }
    
    @IBAction func reCalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
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
