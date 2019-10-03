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
    //var selectedImage: UIImage?
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
    
}
extension PostServicesViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

        var selectedImage: UIImage?
        if let editedImage = info[.editedImage] as? UIImage {
            selectedImage = editedImage
            self.photo.image = selectedImage!
            picker.dismiss(animated: true, completion: nil)
        } else if let originalImage = info[.originalImage] as? UIImage {
            selectedImage = originalImage
            self.photo.image = selectedImage!
            picker.dismiss(animated: true, completion: nil)
        }

    }
}


