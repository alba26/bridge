//
//  PostTableViewCell.swift
//  bridge_proto
//
//  Created by William Roland Hernando on 06/04/21.
//

import UIKit

class CommentTableViewCell: UITableViewCell {

    static let identifier = "CommentTableViewCell"
    
    @IBOutlet var imagevew:UIImageView!
    @IBOutlet var labelpost:UILabel!
    
    static func nib() -> UINib {
        return UINib(nibName: "CommentTableViewCell", bundle: nil )
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }

    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    public func configure(){
        //self.backgroundColor = .white
        self.imagevew.layer.cornerRadius = imagevew.frame.size.width/2
//        self.labelpost.textColor = UIColor.init(named: "Color")
        self.labelpost.adjustsFontSizeToFitWidth = true
        self.labelpost.text = "Lorem Ipsum This Comment "
        self.imagevew.contentMode = .scaleAspectFill
        
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

