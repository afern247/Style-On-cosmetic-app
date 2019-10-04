//
//  UserSalonViewController.swift
//  StyleOn
//
//  Created by Ramses Machado on 10/2/19.
//  Copyright © 2019 Ramses Machado. All rights reserved.
//

import UIKit
import FirebaseAuth

class UserSalonViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func logOutTouchUpInside(_ sender: Any) {
         
        do {
            try Auth.auth().signOut()
        } catch let logoutError {
            print(logoutError)
        }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil);
        let vc = storyboard.instantiateViewController(withIdentifier: "mainLoginPage")
        self.present(vc, animated: false, completion: nil);
        //self.performSegue(withIdentifier: "loginSegue", sender: nil)
        //print(Auth.auth().currentUser)
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
