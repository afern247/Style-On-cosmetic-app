//
//  LoginUserViewController.swift
//  StyleOn
//
//  Created by Ramses Machado on 9/11/19.
//  Copyright © 2019 Ramses Machado. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginUserViewController: UIViewController {

    
    @IBOutlet var emailTextField: UITextField!
    
    @IBOutlet var passwordTextField: UITextField!
    
    @IBOutlet var loginButtonRounded: UIButton!
    
    @IBOutlet var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loginButtonRounded.layer.cornerRadius = 20.0
        self.loginButtonRounded.layer.borderWidth = 1.0
        self.loginButtonRounded.layer.borderColor = UIColor.white.cgColor
        
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
        setUpElements()
    }
    

    func setUpElements(){
        errorLabel.alpha = 0
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func loginTapped(_ sender: Any) {
        
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        Auth.auth().signIn(withEmail: email, password: password) {(result, error) in
            if error != nil {
                
                self.errorLabel.text = error!.localizedDescription
                self.errorLabel.alpha = 1
                //Cuden't sign in
            }
            else {
                
                let salonViewController = self.storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.salonViewController) as? SalonViewController
                
                self.view.window?.rootViewController = salonViewController
                self.view.window?.makeKeyAndVisible()
            }
    }
    
}
}
