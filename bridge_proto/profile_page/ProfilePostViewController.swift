//
//  ProfilePostViewController.swift
//  bridge_proto
//
//  Created by Novianto Hermawan on 12/04/21.
//

import UIKit


class ProfilePostViewController: UIViewController{
    
    
    @IBOutlet weak var postTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        postTableView.delegate = self
        postTableView.dataSource = self
        postTableView.register(UINib(nibName: "PostTableViewCell", bundle: nil), forCellReuseIdentifier: "postCell")
        
    }
    
    
}

extension ProfilePostViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let stryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = stryboard.instantiateViewController(withIdentifier: "postDetail")
//        present(vc, animated: true, completion: nil)
        self.navigationController?.pushViewController(vc, animated: true)
        
        print("TESTTTTTT")
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as! PostTableViewCell
        
        cell.nameLabel.text = "Pamungkas"
        cell.jobLabel.text = "@pamungqas"
        cell.postTimeLabel.text = "4 hours ago"
        cell.postLabel.text = "In an unbalanced world where openness is jewelry; i'll be in the corner finding rhymes with a head thats cracked but full of dreams & colours."
        cell.postLabel.sizeToFit()
        cell.postImage.image = UIImage(named: "profileImage")
        cell.postImage.layer.cornerRadius = cell.postImage.frame.height/2
        cell.selectionStyle = .none
        
        return cell
    }
    
//    func tableView(_ tableView: UITableView,  heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return CGFloat(postTableView.frame.height/2)
//    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
            return CGFloat(220) //guide post
        
    }
    
}
