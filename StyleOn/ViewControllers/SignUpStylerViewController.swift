//
//  SignUpStylerViewController.swift
//  StyleOn
//
//  Created by Ramses Machado on 9/11/19.
//  Copyright © 2019 Ramses Machado. All rights reserved.
//

import UIKit

class SignUpStylerViewController: UIViewController {

    @IBOutlet var RegisterButtonSignupStyler: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.RegisterButtonSignupStyler.layer.cornerRadius = 20.0
        self.RegisterButtonSignupStyler.layer.borderWidth = 1.0
        self.RegisterButtonSignupStyler.layer.borderColor = UIColor.white.cgColor
        
        super.viewDidLoad()
        let topColor = UIColor(red: 162/255, green: 21/255, blue: 65/255, alpha: 1)
        let bottomColor = UIColor(red: 0/255, green: 194/255, blue: 189/255, alpha: 1)
        
        let gradientColors: [CGColor] = [topColor.cgColor, bottomColor.cgColor]
        let gradientLocations: [Float] = [0.0, 0.5]
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        
        gradientLayer.colors = gradientColors
        gradientLayer.locations = gradientLocations as [NSNumber]?
        
        gradientLayer.frame = self.view.bounds
        self.view.layer.insertSublayer(gradientLayer, at: 0)

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
