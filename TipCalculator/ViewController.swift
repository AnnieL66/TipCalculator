//
//  ViewController.swift
//  TipCalculator
//
//  Created by Yaxin Liu on 10/6/20.
//  Copyright © 2020 Yaxin Liu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var amountBeforeTax: UITextField!
    @IBOutlet weak var totalResultLabel: UILabel!
    @IBOutlet weak var tipPercentageLabel: UITextField!
    @IBOutlet weak var tipPercentageSlider: UISlider!
    @IBOutlet weak var numberOfPeopleSlider: UISlider!
    @IBOutlet weak var numberOfPeopleLabel: UITextField!
    @IBOutlet weak var amountPerPerson: UILabel!
    
    var tipPercentage: Double = 0
    var tipAmount: Double = 0
    var totalAmount: Double = 0
    var bill: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        amountBeforeTax.becomeFirstResponder()
    }
    
    @IBAction func tipSliderValueChange(_ sender: Any) {
        tipPercentageLabel.text = String(format: "%0.2d%%", Int(tipPercentageSlider.value))
        calculateChange()
    }
    
    @IBAction func numberOfPeopleValueChange(_ sender: Any) {
        numberOfPeopleLabel.text = "\(Int(numberOfPeopleSlider.value))"
        calculateChange()
    }
    
    @IBAction func amountChange(_ sender: Any) {
        calculateChange()
    }
    
    func calculateChange(){
        let bill = Double(amountBeforeTax.text!) ?? 0
        tipAmount = bill *  Double(tipPercentageSlider.value)/100.0
        totalAmount = tipAmount + bill
        totalResultLabel.text = String(format: "$%0.2f", totalAmount)
        let numberOfPeopleLabel: Int = Int(numberOfPeopleSlider.value)
        amountPerPerson.text = String(format: "$%0.2f", totalAmount/Double(numberOfPeopleLabel))
    }
}

