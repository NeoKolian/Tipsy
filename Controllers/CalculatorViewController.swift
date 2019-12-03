//
//  CalculatorViewController.swift
//  Tipsy
//
//  Created by Nikolay Pochekuev on 03.12.2019.
//  Copyright © 2019 Nikolay Pochekuev. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var stepperValue: Float = 0
    var billValue: Float = 0
    var tipAmount: Float = 0
    var check: Float = 0
    
    @IBAction func tipChanged(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
            tipAmount = 0.0
        case 2:
            tenPctButton.isSelected = true
            zeroPctButton.isSelected = false
            twentyPctButton.isSelected = false
            tipAmount = 0.1
        case 3:
            twentyPctButton.isSelected = true
            tenPctButton.isSelected = false
            zeroPctButton.isSelected = false
            tipAmount = 0.2
        default:
            tenPctButton.isSelected = true
        }
        billTextField.endEditing(true)
    }
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(Int(sender.value))
        stepperValue = Float(sender.value)
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        billValue = Float(billTextField.text!)!
        check = ((billValue + (billValue * tipAmount)) / stepperValue)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.totalValue = check
            destinationVC.numberOfPeople = stepperValue
            destinationVC.tipPrecentage = tipAmount
        }
    }
}
