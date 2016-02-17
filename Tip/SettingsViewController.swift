//
//  SettingsViewController.swift
//  Tip
//
//  Created by TriNgo on 2/5/16.
//  Copyright © 2016 TriNgo. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        onLoadSettingInfos()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onValueChanged(sender: AnyObject) {
        onSaveSettingInfos()
    }

    func onSaveSettingInfos(){
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(tipControl.selectedSegmentIndex, forKey: "tip_percentage")
        defaults.synchronize()
    }
    
    func onLoadSettingInfos(){
        let defaults = NSUserDefaults.standardUserDefaults()
        let tipPercentageFromSetting = defaults.integerForKey("tip_percentage")
        tipControl.selectedSegmentIndex = tipPercentageFromSetting
    }
}
