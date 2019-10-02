//
//  PostServicesViewController.swift
//  StyleOn
//
//  Created by Ramses Machado on 10/2/19.
//  Copyright © 2019 Ramses Machado. All rights reserved.
//

import UIKit

class PostServicesViewController: UIViewController {
    @IBOutlet weak var photo: UIImageView!
    
    @IBOutlet var descriptionTextView: UITextView!
    @IBOutlet var postButton: UIButton!
    var selectedImage: UIImage?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.handleSelectPhoto))
        photo.addGestureRecognizer(tapGesture)
        photo.isUserInteractionEnabled = true

        // Do any additional setup after loading the view.
    }
    
    @objc func handleSelectPhoto(){
        
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        present(pickerController, animated: true, completion: nil)
        
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
extension PostServicesViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    private func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        print("did Finish Picking Media")
        if let image = info["UIImagePickerControllerOriginalImage"] as? UIImage{
            selectedImage = image
            photo.image = image
            
        }
        dismiss(animated: true, completion: nil)
    }
}
