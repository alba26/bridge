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
        return feedGuideData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "guideCell", for: indexPath) as! GuideCollectionViewCell

        let guidePost = feedGuideData[indexPath.row]
        cell.guideImage.image = guidePost.backgroundPhoto
        cell.guideLabel.text = guidePost.guideTitle
        cell.profileImage.image = guidePost.photo

        cell.profileImage.layer.cornerRadius = cell.profileImage.frame.width/2
        cell.unameLabel.text = guidePost.name
        cell.guideView.layer.cornerRadius = 4
        cell.guideView.clipsToBounds = true

        return cell
    }
    
    //size cellnya
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/3, height: collectionView.frame.height-10)
    }
    
}
