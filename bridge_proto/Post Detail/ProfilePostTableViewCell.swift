//
//  PostTableViewCell.swift
//  bridge_proto
//
//  Created by William Roland Hernando on 06/04/21.
//

import UIKit

class ProfilePostTableViewCell: UITableViewCell {

    static let identifier = "ProfilePostTableViewCell"
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    @IBOutlet var imagevew:UIImageView!
    @IBOutlet var labelpost:UILabel!
    
    static func nib() -> UINib {
        return UINib(nibName: "ProfilePostTableViewCell", bundle: nil )
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        labelpost.frame.size.width = screenWidth - 40
        
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    public func configure(){
        //self.backgroundColor = .white
        self.imagevew.layer.cornerRadius = imagevew.frame.size.width/2
        self.labelpost.numberOfLines = 5
        self.labelpost.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
        self.imagevew.contentMode = .scaleToFill
        
    }
//    private let myLabel: UILabel = {
//        let label = UILabel()
//        return label
//    }
//
//    private let myImageView: uiimage = {
//        let imageview = UIImage()
//        return imageview
//    }
    
    
    
}

