import UIKit
import FirebaseAuth

class LoginStylerViewController: UIViewController {
    
    @IBOutlet var styleremailTextField: UITextField!
    @IBOutlet var stylerpasswordTextField: UITextField!
    @IBOutlet var stylerloginButtonRounded: UIButton!
    @IBOutlet var errorLabelstyler: UILabel!
    
    override func viewDidLoad() {
                super.viewDidLoad()
        
        errorLabelstyler.alpha = 0
        
        self.stylerloginButtonRounded.layer.cornerRadius = 20.0
        self.stylerloginButtonRounded.layer.borderWidth = 1.0
        self.stylerloginButtonRounded.layer.borderColor = UIColor.white.cgColor
        
        
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
        
        // Remove before production
        
        // Styler: XIbRKL7cK9N6Y4N7lRaoBsw2R5A3
//        styleremailTextField.insertText("afern247@gmail.com")
//        stylerpasswordTextField.insertText("123456")
        styleremailTextField.insertText("testtest@gmail.com")
        stylerpasswordTextField.insertText("@Ra2s3Ddf12345")
        
        // USer
//        styleremailTextField.insertText("test3test3@gmail.com")
//        stylerpasswordTextField.insertText("@Rasdfg1234")
        
    }


    @IBAction func StylerLoginButtonTapped(_ sender: Any) {
        
        let email = styleremailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = stylerpasswordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Signing in the user
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            
            if error != nil {
                // Couldn't sign in
                self.errorLabelstyler.text = error!.localizedDescription
                self.errorLabelstyler.alpha = 1
            }
            else {
                self.performSegue(withIdentifier: "loginStylerSegue", sender: nil)
            }
        }
        
    }
    
}
