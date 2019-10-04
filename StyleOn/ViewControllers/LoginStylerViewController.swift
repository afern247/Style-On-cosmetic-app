//
//  LoginStylerViewController.swift
//  StyleOn
//
//  Created by Ramses Machado on 9/11/19.
//  Copyright © 2019 Ramses Machado. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginStylerViewController: UIViewController {
    
    @IBOutlet var styleremailTextField: UITextField!
    @IBOutlet var stylerpasswordTextField: UITextField!
    @IBOutlet var stylerloginButtonRounded: UIButton!
    @IBOutlet var errorLabelstyler: UILabel!
    
    override func viewDidLoad() {
                super.viewDidLoad()
        
        errorLabelstyler.alpha = 0
        
        self.stylerloginButtonRounded.layer.cornerRadius = 20.0
        self.stylerloginButtonRounded.layer.borderWidth = 1.0
        self.stylerloginButtonRounded.layer.borderColor = UIColor.white.cgColor
        
        
        super.viewDidLoad()
        let topColor = UIColor(red: 162/255, green: 21/255, blue: 255/255, alpha: 1)
        let bottomColor = UIColor(red: 0/255, green: 194/255, blue: 189/255, alpha: 1)
        
        let gradientColors: [CGColor] = [topColor.cgColor, bottomColor.cgColor]
        let gradientLocations: [Float] = [0.0, 0.5]
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        
        gradientLayer.colors = gradientColors
        gradientLayer.locations = gradientLocations as [NSNumber]?
        
        gradientLayer.frame = self.view.bounds
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        // Do any additional setup after loading the view.
    
        // Remove before production
        styleremailTextField.insertText("afern247@gmail.com")
        stylerpasswordTextField.insertText("123456")
        
    }


    @IBAction func StylerLoginButtonTapped(_ sender: Any) {
        
        
        // TODO: Validate Text Fields
        
        
        let email = styleremailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = stylerpasswordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Signing in the user
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            
            if error != nil {
                // Couldn't sign in
                self.errorLabelstyler.text = error!.localizedDescription
                self.errorLabelstyler.alpha = 1
            }
            else {
                
                self.performSegue(withIdentifier: "loginStylerSegue", sender: nil)

            }
        }
        
    }
    
}
