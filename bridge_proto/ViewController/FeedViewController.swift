//
//  FeedViewController.swift
//  bridge_proto
//
//  Created by Felinda Gracia Lubis on 07/04/21.
//

import UIKit

class FeedViewController: UIViewController {
    
    @IBOutlet weak var postTV: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    //setup table view dan register Nib
    func setup () {
        postTV.delegate = self
        postTV.dataSource = self
        postTV.register(UINib(nibName: "PostTableViewCell", bundle: nil), forCellReuseIdentifier: "postCell")
        postTV.register(UINib(nibName: "CollectionTableViewCell", bundle: nil), forCellReuseIdentifier: "collectionTVCell")
    }
    
}


//MARK: TableView Delegate & DataSource Methods
extension FeedViewController: UITableViewDelegate, UITableViewDataSource {
    
    //size cellnya
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row != 0 {
            return UITableView.automaticDimension
        } else {
            return CGFloat(220) //guide post
        }
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row != 0 {
            return UITableView.automaticDimension
        } else {
            return CGFloat(220) //guide post
        }   
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedPostData.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //cell buat post
        if indexPath.row != 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "postCell") as! PostTableViewCell
            
            let postDummy = feedPostData[indexPath.row]
            cell.nameLabel.text = postDummy.name
            cell.jobLabel.text = postDummy.profession
            cell.postTimeLabel.text = postDummy.time
            cell.postLabel.text = postDummy.post
            cell.postImage.image = postDummy.photo

            cell.postImage.layer.cornerRadius = cell.postImage.frame.height/2
            cell.selectionStyle = .none
            
            return cell
        } else {
            //cell buat collection view guide
            let cell = tableView.dequeueReusableCell(withIdentifier: "collectionTVCell") as! CollectionTableViewCell
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if feedPostData.count == 0 {
            return nil
        } else {
            return indexPath
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let stryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = stryboard.instantiateViewController(withIdentifier: "postDetail")
        //        present(vc, animated: true, completion: nil)
        self.navigationController?.pushViewController(vc, animated: true)
       
       
        
    }
}
