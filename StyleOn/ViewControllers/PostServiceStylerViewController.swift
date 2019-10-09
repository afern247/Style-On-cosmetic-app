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

class PostServiceStylerViewController: UITabBarController {

    @IBOutlet var postImageView: UIImageView!
    @IBOutlet var captionTextView: UITextView!
    var textViewPlaceholderText = "Tell us about your service"
    
    var selectedImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func postDidTap(_ sender: Any) {
        
        if captionTextView.text != textViewPlaceholderText && captionTextView.text != "" && selectedImage != nil {
            let newPost = Post(image: self.selectedImage, caption: self.captionTextView.text)
            newPost.save()
            self.dismiss(animated: true, completion: nil)
        }
    }
    @IBAction func cancelDidTap(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
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

extension PostServiceStylerViewController {
    
    func uploadImage(_ image:UIImage, completion: @escaping (_ url: URL?) -> ()){
        let storageRef = Storage.storage().reference().child("myimage.png")
        let imgData = postImageView.image?.pngData()
        let metaData = storageMetadata()
        metaData.contentType = "image/png"
        storageRef.putData(imageData!, metadata: metaData) { (metadata, error) in
            if error == nil{
                print("success")
                storageRef.downloadUrl(completion: { (url, error) in completion(url!)
                })
            }
        }
    }
}
