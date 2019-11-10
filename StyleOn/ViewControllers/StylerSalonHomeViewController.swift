import UIKit
import Firebase
import FirebaseAuth
import Foundation

class StylerSalonHomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
        
    // Instantiate table view to post content
    var tableView:UITableView!

    var posts = [Post]()
    
    // Loads current view
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView = UITableView(frame: view.bounds, style: .plain)
        
        let cellNib = UINib(nibName: "PostTableViewCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "postCell")
        
        view.addSubview(tableView)
        
        var layoutGuide:UILayoutGuide
        
        if #available(iOS 11.0, *){
            layoutGuide = view.safeAreaLayoutGuide
        }
        
        layoutGuide = view.safeAreaLayoutGuide
        
        tableView.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: layoutGuide.topAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor).isActive = true
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        
        observe()
        
        tableView.reloadData()

    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as! PostTableViewCell
        cell.set(post: posts[indexPath.row])
        return cell
    }
    
    internal func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

             return 180
     }
    
    
    
    @IBAction func handleLogout(_ target: UIBarButtonItem) {
        try! Auth.auth().signOut()
        self.dismiss(animated: false, completion: nil)
    }


    func observe() {
        let postsRef = Database.database().reference(withPath: "post")
                
                postsRef.observe(.value, with: { snapshot in
                    
                    var tempPosts = [Post]()
                    
                    for child in snapshot.children {
                        if let childSnapshot = child as? DataSnapshot,
                            let data = childSnapshot.value as? [String:Any],
//                            let timestamp = data["timestamp"] as? Double,
                            let first_name = data["Author"] as? String,
                            let postTitle = data["title"] as? String,
                            let postDescription = data["description"] as? String,
                            let postUrl = data["postUrl"] as? String,
                            let postAddress = data["Address"] as? String,
                            let url = URL(string:postUrl)
                        {
                        
                            // Convert timestamp to date
//                            let newDate = self.getDateFromTimeStamp(timestamp:timestamp)
                        
                            // Store variables from DB into post
                            let post = Post(author: first_name, postTitle: postTitle, postDescription: postDescription, postUrl: url, postAddress: postAddress)

                            tempPosts.append(post)
                            
                        }
                        
                    }
                    
                    self.posts = tempPosts
                    self.tableView.reloadData()
                    
                })
    }


    func getDateFromTimeStamp(timestamp : Double) -> String {
        
        let date = Date(timeIntervalSince1970: timestamp)
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT") //Set timezone that you want
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = "HH:mm" //Specify your format that you want
        let strDate = dateFormatter.string(from: date)
        
        return strDate
    }

    
    
    
    
    
    
}
