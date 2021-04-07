//
//  File.swift
//  bridge_proto
//
//  Created by Adhitya Laksamana Bayu Adrian on 06/04/21.
//

import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var sgmControlProfile: UISegmentedControl!
    

    @IBOutlet weak var profilePost: UIView!
    
    @IBOutlet weak var profileGuide: UIView!
    
    
    @IBOutlet weak var profileWorkspace: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImage.layer.masksToBounds=true
        profileImage.layer.cornerRadius = profileImage.bounds.width/2
        
        profilePost.alpha = 1
        profileGuide.alpha = 0
        profileWorkspace.alpha = 0
        
        
//        let DEFAULT_TXT_COLOR = [NSAttributedString.Key.foregroundColor: UIColor.white]
//        let SELECTED_TXT_COLOR = [NSAttributedString.Key.foregroundColor: UIColor.black]
//
//        sgmControlProfile.setTitleTextAttributes(DEFAULT_TXT_COLOR, for: .normal)
//        sgmControlProfile.setTitleTextAttributes(SELECTED_TXT_COLOR, for: .selected)
//
//
//        sgmControlProfile.backgroundColor = .clear
//        sgmControlProfile.tintColor = .clear
//
//        sgmControlProfile.setTitleTextAttributes([
//            NSAttributedString.Key.font : UIFont(name: "DINCondensed-Bold", size: 18)!,
//            NSAttributedString.Key.foregroundColor: UIColor.lightGray
//            ], for: .normal)
//
//        sgmControlProfile.setTitleTextAttributes([
//            NSAttributedString.Key.font : UIFont(name: "DINCondensed-Bold", size: 18)!,
//            NSAttributedString.Key.foregroundColor: UIColor.orange
//            ], for: .selected)
//
//
//        let buttonBar = UIView()
//        buttonBar.translatesAutoresizingMaskIntoConstraints = false
//        buttonBar.backgroundColor = UIColor.orange
//
//
//
    }
    
    
    
    
    @IBAction func changeSGM(_ sender: UISegmentedControl) {
        
        if sgmControlProfile.selectedSegmentIndex == 0{
            profilePost.alpha = 1
            profileGuide.alpha = 0
            profileWorkspace.alpha = 0
        }else if sgmControlProfile.selectedSegmentIndex == 1{
            profilePost.alpha = 0
            profileGuide.alpha = 1
            profileWorkspace.alpha = 0
        }else{
            profilePost.alpha = 0
            profileGuide.alpha = 0
            profileWorkspace.alpha = 1
        }
    }
    
    
    
    
    



}



