//
//  ViewController.swift
//  Tipsy
//
//  Created by Lily Pham on 1/6/19.
//  Copyright © 2019 Lily Pham. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    let formatter = NumberFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setZeroLabels()
    }
    
    func setZeroLabels() {
        formatter.numberStyle = .currency
        formatter.currencyCode = Locale.current.currencyCode
        formatter.currencySymbol = NSLocale.current.currencySymbol
        tipLabel.text = formatter.string(from: 0 as NSNumber)
        totalLabel.text = formatter.string(from: 0 as NSNumber)
    }

    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        let tipPercentages = [0.10, 0.15, 0.18]
        let bill = Double(billField.text!) ?? 0
        let tip = bill*tipPercentages[tipControl.selectedSegmentIndex]
        let total = tip + bill
        
        let tipText = formatter.string(from: tip as NSNumber) as! String
        
        tipLabel.text = "+" + tipText
        totalLabel.text = formatter.string(from: total as NSNumber)
    }
}

