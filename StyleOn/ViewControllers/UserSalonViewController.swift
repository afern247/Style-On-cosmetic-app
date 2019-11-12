import UIKit
import Firebase
import FirebaseAuth
import Foundation

class UserSalonViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    
    // This is the view to display all posts from all Authors
    @IBOutlet var allPostsTableView: UITableView!
    @IBOutlet weak var featuredPostsCollectionView: UICollectionView!
    
    
    var posts = [UserPosts]()
    let productCollectionViewId = "FeaturedPostsCollectionViewCell"
    
    var products = [FeaturedPosts]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cellNib = UINib(nibName: "UserPostViewCell", bundle: nil)
        allPostsTableView.register(cellNib, forCellReuseIdentifier: "postCell")
        
        allPostsTableView.delegate = self
        allPostsTableView.dataSource = self
        allPostsTableView.tableFooterView = UIView()
        
        observe()
        
        allPostsTableView.reloadData()
        
        // Register cell
        let nibCell = UINib(nibName: productCollectionViewId, bundle: nil)
        featuredPostsCollectionView.register(nibCell, forCellWithReuseIdentifier: productCollectionViewId)
        
        
//         init data
        for _ in 1...25 {
            let product = FeaturedPosts()
            product?.Name = ""
            product?.desc = ""
            products.append(product!)
        }
        
        featuredPostsCollectionView.reloadData()
        
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
                            let post_address = data["Address"] as? String,
                            let postDescription = data["description"] as? String,
                            let postUrl = data["postUrl"] as? String,
                            let url = URL(string:postUrl)
                        {
                            // Convert timestamp to date
    //                      let newDate = self.getDateFromTimeStamp(timestamp:timestamp)

                                // Store variables from DB into post
                            let post = UserPosts(author: first_name, postTitle: postTitle, postDescription: postDescription, postUrl: url, postAddress: post_address)

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
    
    
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return products.count
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 310, height: 350)
    }
    

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeaturedPostsCollectionViewCell", for: indexPath) as! FeaturedPostsCollectionViewCell
        let product = products[indexPath.row]
        cell.featuredImage.image = UIImage(named: "3")
        cell.lbName.text = product.Name!
        cell.lbDesc.text = product.desc!
        
        return cell
    }
    
        
    
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
//    }

//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let collectionViewWidth = collectionView.bounds.width
//        return CGSize(width: collectionViewWidth/3, height: collectionViewWidth/3)
//    }

//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 20
//    }
    
    
    
    
    

    
    
}



