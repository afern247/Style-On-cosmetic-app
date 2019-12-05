import UIKit
import FirebaseAuth

class LoginUserViewController: UIViewController {

    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var loginButtonRounded: UIButton!
    @IBOutlet var errorLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        errorLabel.alpha = 0
        
        self.loginButtonRounded.layer.cornerRadius = 20.0
        self.loginButtonRounded.layer.borderWidth = 1.0
        self.loginButtonRounded.layer.borderColor = UIColor.white.cgColor
        
        
        super.viewDidLoad()
        let topColor = UIColor(red: 162/255, green: 21/255, blue: 255/255, alpha: 1)
        let bottomColor = UIColor(red: 0/255, green: 194/255, blue: 189/255, alpha: 1)
        
        let gradientColors: [CGColor] = [topColor.cgColor, bottomColor.cgColor]
        let gradientLocations: [Float] = [0.0, 0.5]
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        
        gradientLayer.colors = gradientColors
        gradientLayer.locations = gradientLocations as [NSNumber]?
        
        gradientLayer.frame = self.view.bounds
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        // Do any additional setup after loading the view.
        
        emailTextField.insertText("test3test3@gmail.com")
        passwordTextField.insertText("@Rasdfg1234")

        
    }

    @IBAction func loginButtonTapped(_ sender: Any) {

        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Signing in the user
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            
            if error != nil {
                // Couldn't sign in
                self.errorLabel.text = error!.localizedDescription
                self.errorLabel.alpha = 1
            }
            else {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)

            }
        }
    }
    
}
