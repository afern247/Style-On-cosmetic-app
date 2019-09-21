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
    


}
