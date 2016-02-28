//
//  CustomUITextField.swift
//  Tippor
//
//  Created by TriNgo on 2/28/16.
//  Copyright © 2016 TriNgo. All rights reserved.
//

import Foundation
import UIKit

class CustomUITextField: UITextField {
    override func canPerformAction(action: Selector, withSender sender: AnyObject?) -> Bool {
        if action == "paste:" {
            return false
        }
        return super.canPerformAction(action, withSender: sender)
    }
}
