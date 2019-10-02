//
//  PostServicesViewController.swift
//  StyleOn
//
//  Created by Ramses Machado on 10/2/19.
//  Copyright © 2019 Ramses Machado. All rights reserved.
//

import UIKit

class PostServicesViewController: UIViewController {
    @IBOutlet var photo: UIImageView!
    
    @IBOutlet var descriptionTextView: UITextView!
    @IBOutlet var postButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.handleSelectPhoto))
        photo.addGestureRecognizer(tapGesture)
        photo.isUserInteractionEnabled = true

        // Do any additional setup after loading the view.
    }
    
    @objc func handleSelectPhoto(){
        
    }
    
    @IBAction func postButtonTuch(_ sender: Any) {
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
