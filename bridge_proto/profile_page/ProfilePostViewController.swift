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
        return profilePostData.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as! PostTableViewCell
        
        
        let postData = profilePostData[indexPath.row]
        cell.nameLabel.text = postData.name
        cell.jobLabel.text = postData.stageName
        cell.postTimeLabel.text = postData.time
        cell.postLabel.text = postData.post
        cell.postLabel.sizeToFit()
        cell.postImage.image = postData.photo
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
