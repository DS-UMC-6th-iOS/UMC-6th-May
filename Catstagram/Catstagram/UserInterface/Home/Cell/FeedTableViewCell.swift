//
//  FeedTableViewCell.swift
//  Catstagram
//
//  Created by 김서윤 on 5/10/24.
//

import UIKit

class FeedTableViewCell: UITableViewCell {

    @IBOutlet var imageViewUserProfile: UIImageView!
    @IBOutlet var labelUserName: UILabel!
    @IBOutlet var imageViewFeed: UIImageView!
    @IBOutlet var buttonIsHeart: UIButton!
    @IBOutlet var buttonIsBookMark: UIButton!
    @IBOutlet var labelHowManyLike: UILabel!
    @IBOutlet var labelFeed: UILabel!
    @IBOutlet var imageViewMyProfile: UIImageView!
    
    @IBAction func actionIsHeart(_ sender: UIButton) {
        if buttonIsHeart.isSelected {
            buttonIsHeart.isSelected = false
        } else {
            buttonIsHeart.isSelected = true
        }
    }
    
    @IBAction func actionIsBookMark(_ sender: UIButton) {
        if buttonIsBookMark.isSelected {
            buttonIsBookMark.isSelected = false
        } else {
            buttonIsBookMark.isSelected = true
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageViewUserProfile.layer.cornerRadius = 12.5
        imageViewUserProfile.clipsToBounds = true
        imageViewMyProfile.layer.cornerRadius = 12.5
        imageViewMyProfile.clipsToBounds = true
        
        let fontSize = UIFont.boldSystemFont(ofSize: 9)
        let attributedStr = NSMutableAttributedString(string: labelFeed.text ?? "")
        attributedStr.addAttribute(.font, value: fontSize, range: NSRange.init(location: 0, length: 3))
        
        labelFeed.attributedText = attributedStr
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
