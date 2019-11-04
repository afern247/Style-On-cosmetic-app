import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet var LogoImage: UIImageView!
    @IBOutlet var RoundedButton: UIButton!
    @IBOutlet var RoundedButton1: UIButton!
    @IBOutlet var ProRoundedButton: UIButton!
    @IBOutlet var ProRegisterRoundedButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            try Auth.auth().signOut()
        } catch let logoutError {
            print(logoutError)
        }
        
        self.RoundedButton.layer.cornerRadius = 20.0
        self.RoundedButton.layer.borderWidth = 1.0
        self.RoundedButton.layer.borderColor = UIColor.white.cgColor
        
        self.ProRoundedButton.layer.cornerRadius = 20.0
        self.ProRoundedButton.layer.borderWidth = 1.0
        self.ProRoundedButton.layer.borderColor = UIColor.white.cgColor
        
        self.ProRegisterRoundedButton.layer.cornerRadius = 20.0 
        self.ProRegisterRoundedButton.layer.borderWidth = 1.0
        self.ProRegisterRoundedButton.layer.borderColor = UIColor.white.cgColor
        
        self.RoundedButton1.layer.cornerRadius = 20.0
        self.RoundedButton1.layer.borderWidth = 1.0
        self.RoundedButton1.layer.borderColor = UIColor.white.cgColor
        
        
        let topColor = UIColor(red: 162/255, green: 21/255, blue: 255/255, alpha: 1)
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

