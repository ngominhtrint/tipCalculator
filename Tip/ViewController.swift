//
//  ViewController.swift
//  Tip
//
//  Created by TriNgo on 2/5/16.
//  Copyright © 2016 TriNgo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billAmountField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var twoManShare: UILabel!
    @IBOutlet weak var threeManShare: UILabel!
    @IBOutlet weak var fourManShare: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        billAmountField.placeholder = "$"
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        onLoadSettingInfos()
        onCalculateTip()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        onCalculateTip()
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }

    func onCalculateTip(){
        var tipPercentages = [0.1, 0.15, 0.2]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        let billAmount = NSString(string: billAmountField.text!).doubleValue
        let tip = billAmount * tipPercentage
        let total = billAmount + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        twoManShare.text = String(format: "$%.2f", total/2)
        threeManShare.text = String(format: "$%.2f", total/3)
        fourManShare.text = String(format: "$%.2f", total/4)
    }

    func onLoadSettingInfos(){
        let defaults = NSUserDefaults.standardUserDefaults()
        let tipPercentageFromSetting = defaults.integerForKey("tip_percentage")
        tipControl.selectedSegmentIndex = tipPercentageFromSetting
    }
    
}

