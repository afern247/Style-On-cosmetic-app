import UIKit
import FirebaseAuth
import Firebase

class SignUpStylerViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet var RegisterButtonSignupStyler: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        errorLabel.alpha = 0
        
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

    }
    
    
    
    //Check the fields and validate taht the data is correct. If everything is correct, this method returns //nilotherwise it returns the error message
    func validateFields() -> String? {

        //Check taht all fields are filled in
        if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {

            return "Please fill in all fields"
        }

        // Check if the password is secure
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)

        if Utilities.isPasswordValid(cleanedPassword) == false {
            // Password isn't secure enough
            return "Please make sure your password is at least 8 characters, contains a special character and a number and test."
        }

        return nil
    }

    @IBAction func SignUpTapped(_ sender: Any) {
        
        //Validate the fields
        let error = validateFields()

        if error != nil {

            showError(error!)

        }
        else {

            // Create clean version of the data
            let firstName = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let phone_number = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)

            //Create the user
            Auth.auth().createUserAndRetrieveData(withEmail: email, password: password) { (result, err) in

                //Check for errors
                if err != nil {

                    self.showError("Error createing user")
                }
                else {
                    //User was created successfully, now store the first name, last name and phone number
                    let db = Firestore.firestore()

                    db.collection("usersBusiness").addDocument(data: ["first_name":firstName, "last_name":lastName, "phone_number":phone_number, "uid": result!.user.uid ]) { (error) in

                        if error != nil {
                            //Show error message
                            self.showError("Error saving user data")
                        }
                    }

                    //Transition to home screen or salon
                    self.transitionToHome()

                }
            }
        }

    }

    func showError(_ message:String) {
        errorLabel.text = message
        errorLabel.alpha = 1
    }

    func transitionToHome(){
        
        self.performSegue(withIdentifier: "loginStylerSegue", sender: nil)
        //let stylerSalonViewController = //storyboard?.instantiateViewController(withIdentifier: //Constants.Storyboard.stylerSalonViewController) as? //StylerSalonViewController

        //view.window?.rootViewController = stylerSalonViewController
        //view.window?.makeKeyAndVisible()
    }





}
