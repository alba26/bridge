//
//  CollectionTableViewCell.swift
//  bridge_proto
//
//  Created by Felinda Gracia Lubis on 07/04/21.
//

import UIKit

class CollectionTableViewCell: UITableViewCell{
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
        collectionView.register(UINib(nibName: "GuideCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "guideCell")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

//MARK: CollectionView Delegate & Data Source
extension CollectionTableViewCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    //jumlah row
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "guideCell", for: indexPath) as! GuideCollectionViewCell
        cell.guideImage.image = UIImage(named: "profileImage")
        cell.guideLabel.text = "5 Tips Latihan Vokal ala Pamungkas"
        cell.profileImage.image = UIImage(named: "profileImage")
        cell.profileImage.layer.cornerRadius = cell.profileImage.frame.width/2
        cell.unameLabel.text = "pamungqas"
        cell.guideView.layer.cornerRadius = 4
        cell.guideView.clipsToBounds = true

        return cell
    }
    
    //size cellnya
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/3, height: collectionView.frame.height-10)
    }
    
}
