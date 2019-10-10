//
//  PostServiceStylerViewController.swift
//  StyleOn
//
//  Created by Ramses Machado on 10/4/19.
//  Copyright © 2019 Ramses Machado. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage
import FirebaseDatabase

class PostServiceStylerViewController: UIViewController {
    
    var ref: DatabaseReference!
    //var ref = DatabaseReference.init()
    
    let imagePicker = UIImagePickerController()
    
    @IBOutlet var postImageView: UIImageView!

    @IBOutlet var postDescriptionTitle: UITextField!
    
    @IBOutlet var postDescription: UITextField!
    
    var selectedImage: UIImage?
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        //This reference the database so it can be used later
        self.ref = Database.database().reference()
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.handleSelectPhoto))
        postImageView.addGestureRecognizer(tapGesture)
        postImageView.isUserInteractionEnabled = true

    }
    
    //This fuction puts the data into Firebase
    @IBAction func postDidTap(_ sender: Any) {
        
        self.saveFIRData()
        
    }
    
    //This function handle the selected photo
    @objc func handleSelectPhoto(){
        
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        present(pickerController, animated: true, completion: nil)
        
    }
    
    //This fuction add the data to the databse
    func saveFIRData(){
        self.uploadImage(self.postImageView.image!){ url in
            self.saveImage(name: self.postDescription.text!, postURL: url!) { success in
                if success != nil
                {
                    print("Yeah")
                }
            }
        }

        }
    }

//This method takes care of secting the image from library
extension PostServiceStylerViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

        var selectedImage: UIImage?
        if let editedImage = info[.editedImage] as? UIImage {
            selectedImage = editedImage
            self.postImageView.image = selectedImage!
            picker.dismiss(animated: true, completion: nil)
        } else if let originalImage = info[.originalImage] as? UIImage {
            selectedImage = originalImage
            self.postImageView.image = selectedImage!
            picker.dismiss(animated: true, completion: nil)
        }

    }
}
///this handles the image
extension PostServiceStylerViewController {

    func uploadImage(_ image:UIImage, completion: @escaping (_ url: URL?) -> ()){
        let storageRef = Storage.storage().reference().child("myimage.png")
        let imgData = postImageView.image?.pngData()
        let metaData = StorageMetadata()
        metaData.contentType = "image/png"
        storageRef.putData(imgData!, metadata: metaData) { (metadata, error) in
            if error == nil {
                print("success")
                storageRef.downloadURL(completion: { (url, error) in
                    completion(url)
                })
            }else{
                print("error in save image")
                completion(nil)
            }
        }
    }
    
    func saveImage(name: String, postURL:URL, completion: @escaping ((_ url: URL?) -> ())){
        let dict = ["title": postDescriptionTitle.text!, "description": postDescription.text!, "postUrl": postURL.absoluteString] as [String: Any]
        self.ref.child("post").childByAutoId().setValue(dict)
    }
    


}
