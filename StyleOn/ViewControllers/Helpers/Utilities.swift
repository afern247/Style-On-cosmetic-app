//
//  Utilities.swift
//  StyleOn
//
//  Created by Ramses Machado on 9/13/19.
//  Copyright © 2019 Ramses Machado. All rights reserved.
//

import Foundation
import UIKit

import Foundation
import UIKit

class Utilities {
    
    
    static func navUserButton(_ button:UIButton) {
        
        button.layer.cornerRadius = button.frame.size.width/2
        button.backgroundColor = UIColor.init(red: 0/255, green: 194/255, blue: 189/255, alpha: 1)
        button.setAttributedTitle(nil, for: .normal)
    }
    
    
    static func navBookingButton(_ button:UIButton) {
        
        // Hollow rounded corner style
        button.layer.cornerRadius = button.frame.size.width/2
        button.backgroundColor = UIColor.init(red: 0/255, green: 194/255, blue: 189/255, alpha: 1)
        button.setAttributedTitle(nil, for: .normal)
    }
    
    static func navServiceButton(_ button:UIButton) {
        
        button.layer.cornerRadius = button.frame.size.width/2
        button.backgroundColor = UIColor.init(red: 0/255, green: 194/255, blue: 189/255, alpha: 1)
        button.setAttributedTitle(nil, for: .normal)
    }
    
    static func styleTextField(_ textfield:UITextField) {
        
        // Create the bottom line
        let bottomLine = CALayer()
        
        bottomLine.frame = CGRect(x: 0, y: textfield.frame.height - 2, width: textfield.frame.width, height: 2)
        
        bottomLine.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1).cgColor
        
        // Remove border on text field
        textfield.borderStyle = .none
        
        // Add the line to the text field
        textfield.layer.addSublayer(bottomLine)
        
    }
    
    static func styleFilledButton(_ button:UIButton) {
        
        // Filled rounded corner style
        button.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1)
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.white
    }
    
    static func styleHollowButton(_ button:UIButton) {
        
        // Hollow rounded corner style
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.black
    }
    static func viewColor(_ view:UIView) {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 50))
        let gradient = CAGradientLayer()
        
        view.backgroundColor = UIColor.init(red: 0/255, green: 194/255, blue: 189/255, alpha: 1)

        gradient.frame = view.bounds
        gradient.colors = [UIColor.white.cgColor, UIColor.black.cgColor]

        view.layer.insertSublayer(gradient, at: 0)
    
    }
    
    static func isPasswordValid(_ password : String) -> Bool {
        
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
    
}
