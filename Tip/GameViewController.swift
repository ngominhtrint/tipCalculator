//
//  GameViewController.swift
//  Tippor
//
//  Created by TriNgo on 6/17/16.
//  Copyright © 2016 TriNgo. All rights reserved.
//

import UIKit

class GameViewController: BaseViewController {

    @IBOutlet weak var knobHolder: UIView!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    var bill: Double!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Create the knob control
        knobControl = IOSKnobControl(frame: knobHolder.bounds)
        knobControl.circular = true

        knobControl.fontName = "Verdana-Bold"
        knobControl.setFillColor(UIColor.init(red: 33/255, green: 77/255, blue: 144/255, alpha: 1.0), forState: .Normal)
        
        knobControl.addTarget(self, action: #selector(GameViewController.knobPositionChanged(_:)), forControlEvents: .ValueChanged)
        knobHolder.addSubview(knobControl)
        
        knobPositionChanged(knobControl)
        
        // initialize all other properties based on initial control values
        updateKnobProperties()
    }
    
    @IBAction func tapToSpin(sender: UIButton) {
        // random from -3.14 to 3.14
        let random : Float = (Float(arc4random()) / 0xFFFFFFFF) * (3.14 - (-3.14)) + (-3.14)
        knobControl.setPosition(knobControl.position, animated: true)
        knobControl.setPosition(random, animated: true)
        knobPositionChanged(knobControl)
    }
    
    // MARK: Action for the knob control's .ValueChanged events
    func knobPositionChanged(sender: IOSKnobControl) {
        let rates = [ 0, 0.05, 0.10, 0.15, 0.2, 0.25, 0.30 ]
        tipLabel.text = (String) (bill * rates[knobControl.positionIndex])
        totalLabel.text = (String) (bill + bill * rates[knobControl.positionIndex])
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateKnobProperties() {
        
        let titles = [ "0%", "5%", "10%", "15%", "20%", "25%", "30%" ]
        let font = UIFont(name: knobControl.fontName, size: 14.0)
        var attribTitles = [NSAttributedString]()
    
        for title in titles {
            let attributed = NSAttributedString(string: title, attributes: [NSFontAttributeName: font!, NSForegroundColorAttributeName: UIColor.whiteColor()])
            attribTitles.append(attributed)
        }
        knobControl.titles = attribTitles
        
        // zoom in the selected item
        knobControl.zoomTopTitle = true
        knobControl.zoomPointSize = 24.0
        knobControl.positions = 7
        knobControl.setImage(nil, forState: .Normal)
        
        // Good idea to do this to make the knob reset itself after changing certain params.
        knobControl.position = knobControl.position
    }

}
