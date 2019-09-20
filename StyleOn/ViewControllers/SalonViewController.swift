import UIKit

class SalonViewController: UIViewController {

    @IBOutlet var userIconButton: UIButton!
    @IBOutlet var bookingIconButton: UIButton!
    @IBOutlet var servicesIconButton: UIButton!
    @IBOutlet weak var topMenuView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // background
        setBackground()
        
        // lower nav-bar icons
        navButtons()
        
        seachBar()
        
    }
    
    func navButtons() {
        
        // Hide the error label
        
        // Style the elements
        Utilities.navBookingButton(bookingIconButton)
        Utilities.navUserButton(userIconButton)
        Utilities.navServiceButton(servicesIconButton)
        
    }
    
    // Func used to set the gradient
    func setBackground(){
        
    }
    
    //  Seach buttom
    func seachBar(){
        
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
