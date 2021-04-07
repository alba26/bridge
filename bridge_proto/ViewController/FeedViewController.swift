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
            return CGFloat(postTV.frame.height/3.5)
        } else {
            return CGFloat(220) //guide post
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //cell buat post
        if indexPath.row != 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "postCell") as! PostTableViewCell
            
            cell.nameLabel.text = "Felin"
            cell.jobLabel.text = "Singer"
            cell.postTimeLabel.text = "4 hours ago"
            cell.postLabel.text = "Hallo test!"
            
            cell.postImage.image = UIImage(named: "profileImage")
            cell.postImage.layer.cornerRadius = cell.postImage.frame.height/2
            cell.selectionStyle = .none
            
            return cell
        } else {
            //cell buat collection view guide
            let cell = tableView.dequeueReusableCell(withIdentifier: "collectionTVCell") as! CollectionTableViewCell
            return cell
        }
    }
}
