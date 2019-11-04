import UIKit
import Firebase
import FirebaseAuth
import Foundation

class StylerSalonHomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
        
    // Instantiate table view to post content
    var tableView:UITableView!

    var posts = [
        Post(id: "1", author: "Ari", text: "I'm scared of hair cuts!"),
        Post(id: "2", author: "Luke Skywalker", text: "I did not like the Last Jedi! Because I did not get to use my awesome Jedi powers!"),
        Post(id: "3", author: "Drizzy Drake", text: "Spittin that fire while I smoke by the fire")
    ]
    
    func checkIfUserIsLoggedIn() {
        if Auth.auth().currentUser?.uid == nil {
            print("######### user is NOT logged in #########")
            perform(#selector(handleLogout), with: nil, afterDelay: 0)
        } else {
            print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ user is logged in @@@@@@@@@@@@@@@@@@@@@@@@@")
            // Gets user ID
            let uid = Auth.auth().currentUser?.uid
            
            // Functions
            print(uid!)
            Database.database().reference().child("post").child(uid!).observeSingleEvent(of: .value, with: {( snapchot ) in
                print(snapchot)
            }, withCancel: nil)
        }
    }
    
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
        tableView.reloadData()
        
//        checkIfUserIsLoggedIn()
        
//        ref.child("post").childByAutoId()


         let postsRef = Database.database().reference(withPath: "post")
        
        postsRef.observe(.value, with: { snapshot in
            
//            var tempPosts = [Post]()
            
            for child in snapshot.children {
                if let childSnapshot = child as? DataSnapshot,
                    let dict = childSnapshot.value as? [String:Any],
//                    let author = dict["author"] as? [String:Any],
//                    let uid = author["uid"] as? String,
//                    let username = author["username"] as? String,
//                    let photoURL = author["photoURL"] as? String,
//                    let url = URL(string:photoURL),
                    let title = dict["title"] as? String
//                    let timestamp = dict["timestamp"] as? Double
                {
                    print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
                    print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
                    print(title)
//                    let userProfile = UserProfile(uid: uid, username: username, photoURL: url)
//                    let post = Post(id: childSnapshot.key, author: userProfile, text: text, timestamp:timestamp)
//                    tempPosts.append(post)
                }
            }
            
//            self.posts = tempPosts
//            self.tableView.reloadData()
            
        })
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
    
    
    @IBAction func handleLogout(_ target: UIBarButtonItem) {
        try! Auth.auth().signOut()
        self.dismiss(animated: false, completion: nil)
    }
}
