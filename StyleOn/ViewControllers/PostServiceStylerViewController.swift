import UIKit
import Firebase
import FirebaseAuth
import Foundation
import FirebaseStorage
import FirebaseDatabase
import CoreLocation

class PostServiceStylerViewController: UIViewController, CLLocationManagerDelegate {
    
    var ref: DatabaseReference!
    
    // Access database from firestore
    let db = Firestore.firestore()
    
    let locationManager = CLLocationManager()
    
    let imagePicker = UIImagePickerController()
    
    @IBOutlet var postImageView: UIImageView!
    @IBOutlet var postDescriptionTitle: UITextField!
    @IBOutlet weak var postDescription: UITextView!
    @IBOutlet weak var addressField: UITextField!
    @IBOutlet weak var zipcodeField: UITextField!
    @IBOutlet weak var tagField: UITextField!
    
    
    var selectedImage: UIImage?
    
    // This override function allows the keyboard to be dismissed once we click outside of any text field
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
    
    override func viewDidLoad() {
        
        locationManager.requestAlwaysAuthorization()
        
        //locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
        
        super.viewDidLoad()
        //This reference the database so it can be used later
        self.ref = Database.database().reference()
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.handleSelectPhoto))
        postImageView.addGestureRecognizer(tapGesture)
        postImageView.isUserInteractionEnabled = true
        
        // This sets the properties of the description view text field
        postDescription.layer.borderWidth = 1.0
        postDescription.layer.borderColor = UIColor.lightGray.cgColor
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            print(location.coordinate)
        }
    }
    
    
    
    
    @IBAction func PostdidTap(_ sender: Any) {
        self.saveFIRData()
        
    }
    //This function handle the selected photo
    @objc func handleSelectPhoto(){
        
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        present(pickerController, animated: true, completion: nil)
        
    }
 
    func saveFIRData(){
        self.uploadImage(self.postImageView.image!){ url in
            if self.postDescription.text != nil && url != nil{
                self.saveImage(name: self.postDescription.text!, postURL: url!) { success in
                if success != nil
                {
                    // Fix this because doesn't work
                    print("Yeah")
                } else {
                    print("ERROR")
                }
            }
        }

        }
    }
}

//This method takes care of selecting the image from library
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

// This handles the image
extension PostServiceStylerViewController {

    func uploadImage(_ image:UIImage, completion: @escaping (_ url: URL?) -> ()){
        let imgTitle = self.postDescriptionTitle.text!
        let storageRef = Storage.storage().reference().child(imgTitle)
        let imgData = postImageView.image?.pngData()
        let metaData = StorageMetadata()
        metaData.contentType = "image/png"
        storageRef.putData(imgData!, metadata: metaData) { (metadata, error) in
            if error == nil {
                storageRef.downloadURL(completion: { (url, error) in
                    completion(url)
                })
                print("Success")
            } else{
                print("####################################################################")
                print("Error in save image")
                print("####################################################################")
                print(error.debugDescription as Any)
                completion(nil)
            }
        }
    }
    
    // This function uploads the image to the DB
    func saveImage(name: String, postURL:URL, completion: @escaping ((_ url: URL?) -> ())){
        
        //Get sspecific document from current user
        let docRef = Firestore.firestore().collection("users").whereField("uid", isEqualTo: Auth.auth().currentUser?.uid ?? "")
        
        // Get data
        docRef.getDocuments { (querySnapshot, err) in
            
            if let err = err {
                print("ERROR: ")
                print(err.localizedDescription)
                return
            } else if querySnapshot!.documents.count != 1 {
                print("More than one documents or none: ")
                print(querySnapshot!.documents.count)
                print(querySnapshot!.documents.description)
            } else {
                print(querySnapshot!.documents.count)
                print(querySnapshot!.documents.description)
                let document = querySnapshot!.documents.first
                let dataDescription = document?.data()
                let firstName = dataDescription?["firstname"] as! String
//                print("This is from DB directly " , dataDescription?["firstname"] as! String)
                
                
                // This uploads the data
                let dict = ["Title": self.postDescriptionTitle.text!,
                            "Description": self.postDescription.text!,
                            "Address": self.addressField.text!,
                            "Zipcode": self.zipcodeField.text!,
                            "Tag": self.tagField.text!,
                            "Timestamp": [".sv":"timestamp"],
                            "Author": firstName,
                            "PostUrl": postURL.absoluteString]
                            as [String: Any]
                        self.ref.child("post").childByAutoId().setValue(dict)
                
                print("####################################################################")
                print("Data UPLOADED!")
                print("####################################################################")
                
            }
        }        
    }
    


        
    
    
    

}

