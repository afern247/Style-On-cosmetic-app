import UIKit

class StylerProfileViewController: UIViewController {
    
    @IBOutlet weak var stylerProfileImage: UIImageView!
    @IBOutlet weak var addService: UIButton!
    @IBOutlet weak var serviceAdded1: UIButton!
    @IBOutlet weak var serviceAdded2: UIButton!
    @IBOutlet weak var serviceAdded3: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Styling profile page UI
        stylerProfilePhoto()
        addServiceButtonStyle()
        
    }
    
    
    
    
    
    
    // This sets the design of the Styler photo profile
    func stylerProfilePhoto(){
        stylerProfileImage.layer.cornerRadius = stylerProfileImage.frame.width/2
        stylerProfileImage.layer.masksToBounds = true
    }
    
    // This sets the design for the Styer add service button
    func addServiceButtonStyle() {
        addService.layer.cornerRadius = addService.frame.width/2
        addService.layer.masksToBounds = true
        addService.clipsToBounds = true
        
        serviceAdded1.layer.cornerRadius = addService.frame.width/2
        serviceAdded1.layer.masksToBounds = true
        serviceAdded1.clipsToBounds = true
        
        serviceAdded2.layer.cornerRadius = addService.frame.width/2
        serviceAdded2.layer.masksToBounds = true
        serviceAdded2.clipsToBounds = true
        
        serviceAdded3.layer.cornerRadius = addService.frame.width/2
        serviceAdded3.layer.masksToBounds = true
        serviceAdded3.clipsToBounds = true
        
    }
    
}
