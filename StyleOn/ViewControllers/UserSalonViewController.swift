import UIKit
import FirebaseAuth

class UserSalonViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func logOutTouchUpInside(_ sender: Any) {
         
        do {
            try Auth.auth().signOut()
        } catch let logoutError {
            print(logoutError)
        }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil);
        let vc = storyboard.instantiateViewController(withIdentifier: "mainLoginPage")
        self.present(vc, animated: false, completion: nil);
    }

}
