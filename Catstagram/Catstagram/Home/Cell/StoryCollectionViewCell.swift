//
//  StoryCollectionViewCell.swift
//  Catstagram
//
//  Created by 김서윤 on 5/24/24.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {
    @IBOutlet var viewImageViewBackground: UIView!
    @IBOutlet var viewUserProfileBackground: UIView!
    @IBOutlet var imageViewUserProfile: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewImageViewBackground.layer.cornerRadius = 24
        viewUserProfileBackground.layer.cornerRadius = 23.5
        imageViewUserProfile.layer.cornerRadius = 22.5
        imageViewUserProfile.clipsToBounds = true
        // Initialization code
    }

}
