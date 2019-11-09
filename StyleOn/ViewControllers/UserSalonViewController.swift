import UIKit
import Firebase
import FirebaseAuth
import Foundation

class UserSalonViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // This is the view to display all posts from all Authors
    @IBOutlet var allPostsTableView: UITableView!

    
    var posts = [UserPosts]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cellNib = UINib(nibName: "UserPostViewCell", bundle: nil)
        allPostsTableView.register(cellNib, forCellReuseIdentifier: "postCell")
        
        allPostsTableView.delegate = self
        allPostsTableView.dataSource = self
        allPostsTableView.tableFooterView = UIView()
        
        observe()
        
        allPostsTableView.reloadData()
        
    }
    
    
    func observe() {
        let postsRef = Database.database().reference(withPath: "post")

                postsRef.observe(.value, with: { snapshot in

                    var tempPosts = [UserPosts]()
                    
                    for child in snapshot.children {
                        if let childSnapshot = child as? DataSnapshot,
                            let data = childSnapshot.value as? [String:Any],
    //                           let timestamp = data["timestamp"] as? Double,
                            let first_name = data["Author"] as? String,
                            let postTitle = data["title"] as? String,
                            let postDescription = data["description"] as? String,
                            let postUrl = data["postUrl"] as? String,
                            let url = URL(string:postUrl)
                        {
                            // Convert timestamp to date
    //                      let newDate = self.getDateFromTimeStamp(timestamp:timestamp)

                                // Store variables from DB into post
                            let post = UserPosts(author: first_name, postTitle: postTitle, postDescription: postDescription, postUrl: url, postAddress: first_name)

                            tempPosts.append(post)
                        }
                    }

                    self.posts = tempPosts
                    self.allPostsTableView.reloadData()

                })
    }
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as! UserPostViewCell
        cell.set(userPost: posts[indexPath.row])
        return cell
    }
    
    internal func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

            return 250
    }
    
    
    
    
    
    

}
