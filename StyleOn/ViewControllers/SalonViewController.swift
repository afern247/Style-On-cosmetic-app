//
//  SalonViewController.swift
//  StyleOn
//
//  Created by Ramses Machado on 9/11/19.
//  Copyright © 2019 Ramses Machado. All rights reserved.
//

import UIKit

class SalonViewController: UIViewController {

    @IBOutlet var userIconButton: UIButton!
    @IBOutlet var bookingIconButton: UIButton!
    @IBOutlet var servicesIconButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        navButtons()
    }
    
    func navButtons() {
        
        // Hide the error label
        
        // Style the elements
        Utilities.navBookingButton(bookingIconButton)
        Utilities.navUserButton(userIconButton)
        Utilities.navServiceButton(servicesIconButton)
        
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
