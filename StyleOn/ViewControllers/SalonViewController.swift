import UIKit

class SalonViewController: UIViewController {
    
    let searchBar = UISearchBar()

    @IBOutlet var userIconButton: UIButton!
    @IBOutlet var bookingIconButton: UIButton!
    @IBOutlet var servicesIconButton: UIButton!
    @IBOutlet weak var seachBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        searchBarCustomizations()
        navButtons()
    }
   
    func searchBarCustomizations() {
        seachBar.layer.cornerRadius = 8
    }
    
    func configureUI() {
        view.backgroundColor = .white
    }
    
    func navButtons() {
        // Style the elements
        Utilities.navBookingButton(bookingIconButton)
        Utilities.navUserButton(userIconButton)
        Utilities.navServiceButton(servicesIconButton)
        
    }
    

}
