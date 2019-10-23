//
//  StylerSalonHomeViewController.swift
//  StyleOn
//
//  Created by Ramses Machado on 10/9/19.
//  Copyright © 2019 Ramses Machado. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import Foundation

class StylerSalonHomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as! PostTableViewCell
        return cell
    }
    

    var tableView:UITableView!
//    var posts = [Post]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView = UITableView(frame: view.bounds, style: .plain)
        //tableView.backgroundColor = UIColor.blue
        
        let cellNib = UINib(nibName: "PostTableViewCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "postCell")
        
        view.addSubview(tableView)
        
        var layoutGuide:UILayoutGuide
        
        layoutGuide = view.safeAreaLayoutGuide
        
        tableView.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: layoutGuide.topAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor).isActive = true
        tableView.reloadData()
        tableView.delegate = self
        tableView.dataSource = self
//        Database.database().reference().child("posts").observe(.childAdded) { (snapshot) in
//            // snapshot is now a dictionary
//            let newPost = Post(snapshot: snapshot)
//            DispatchQueue.main.async {
//                self.posts.insert(newPost, at: 0)
//                let indexPath = IndexPath(row: 0, section: 0)
//                self.tableView.insertRows(at: [indexPath], with: .top)
//            }
//        }
        // Do any additional setup after loading the view.
        
    
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return posts.count
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell", for: indexPath) as! PhotoTableViewCell
//        let post = self.posts[indexPath.row]
//        
//        cell.post = post
//
//        return cell
//    }
    @IBAction func handleLogout(_ sender: Any) {
        
        try! Auth.auth().signOut()
    }
}
