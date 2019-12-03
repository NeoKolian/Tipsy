//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Nikolay Pochekuev on 03.12.2019.
//  Copyright © 2019 Nikolay Pochekuev. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var totalValue: Float = 0
    var numberOfPeople: Float = 0
    var tipPrecentage: Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        totalLabel.text = String(format: "%.2f", totalValue)
        let tipCount = tipPrecentage * 100
        settingsLabel.text = String("Split between \(Int(numberOfPeople)) people, with \(Int(tipCount))% tip.")
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
         self.dismiss(animated: true, completion: nil)
    }
    
}
