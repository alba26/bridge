//
//  ProfileGuideViewController.swift
//  bridge_proto
//
//  Created by Octavianus Bastian on 08/04/21.
//

import UIKit

class ProfileGuideViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "GuideCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "guideCell")

    }
}

extension ProfileGuideViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    //jumlah row
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return profileGuideData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "guideCell", for: indexPath) as! GuideCollectionViewCell
        
        let guideData = profileGuideData[indexPath.row]
        cell.guideImage.image = guideData.backgoundPhoto
        cell.guideLabel.text = guideData.title
        cell.profileImage.isHidden = true
        cell.profileImage.layer.cornerRadius = cell.profileImage.frame.width/2
        cell.unameLabel.isHidden = true
        cell.guideView.layer.cornerRadius = 4
        cell.guideView.clipsToBounds = true

        return cell
    }
    
    //size cellnya
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width/2)-10, height: collectionView.frame.height/2)
    }
    
}
