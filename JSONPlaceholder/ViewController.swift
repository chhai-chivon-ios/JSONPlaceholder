//
//  ViewController.swift
//  JSONPlaceholder
//
//  Created by Chhai Chivon on 1/17/20.
//  Copyright © 2020 Chhai Chivon. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var postTableView: UITableView!
    var posts = [Post]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //Assign data source to product table view
        postTableView.dataSource = self
        postTableView.delegate = self
        
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        
        let task = URLSession.shared.dataTask(with: url) { (data, res, err) in
            let jsonDecoder = JSONDecoder()
            let posts = try! jsonDecoder.decode([Post].self, from: data!)
            self.posts = posts
            DispatchQueue.main.async {
                self.postTableView.reloadData()
            }
        }
        task.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "post_table_view_cell")
        let post = posts[indexPath.row]
        cell?.textLabel?.text = post.title
        cell?.detailTextLabel?.text = post.body
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("user click row ",indexPath.row)
    }

}

