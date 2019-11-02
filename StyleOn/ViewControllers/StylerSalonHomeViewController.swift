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
