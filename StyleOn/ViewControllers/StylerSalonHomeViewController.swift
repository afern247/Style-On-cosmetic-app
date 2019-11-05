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
        tableView.reloadData()
        
        observe()

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


    func observe() {
        let postsRef = Database.database().reference(withPath: "post")
                
                postsRef.observe(.value, with: { snapshot in
                    
                    var tempPosts = [Post]()
                    
                    for child in snapshot.children {
                        if let childSnapshot = child as? DataSnapshot,
                            let data = childSnapshot.value as? [String:Any],
//                            let id = dict["timestamp"] as? String,
                            let postTitle = data["title"] as? String,
                            let postDescription = data["description"] as? String
                        {
                        
                        print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")

                            let post = Post(id: "asd", postTitle: postTitle, text: postDescription)
                         
                            tempPosts.append(post)
                            
                            for x in tempPosts{
                                print(x.text)
                            }
                        }
                    }
                    
                    self.posts = tempPosts
                    self.tableView.reloadData()
                    
                })
    }




    
    
    
    
    
    
}
