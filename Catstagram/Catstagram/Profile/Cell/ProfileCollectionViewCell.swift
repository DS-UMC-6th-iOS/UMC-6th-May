//
//  ProfileCollectionViewCell.swift
//  Catstagram
//
//  Created by 김서윤 on 5/24/24.
//

import UIKit

class ProfileCollectionViewCell: UICollectionViewCell {
    static let indetifier = "ProfileCollectionViewCell"
    
    @IBOutlet var profileImageView: UIImageView!
    
    @IBOutlet var addProfileImageView: UIImageView!
    
    @IBOutlet var editButton: UIButton!
    
    @IBOutlet var addFriendButton: UIButton!
    
    @IBOutlet var postingCountLabel: UILabel!
    
    @IBOutlet var followerCountLabel: UILabel!
    
    @IBOutlet var followingCountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupAttribute()
    }

    private func setupAttribute() {
        profileImageView.layer.cornerRadius = 88 / 2
        addProfileImageView.layer.cornerRadius = 24 / 2
        
        editButton.layer.cornerRadius = 5
        editButton.layer.borderColor = UIColor.lightGray.cgColor
        editButton.layer.borderWidth = 1
        
        addFriendButton.layer.cornerRadius = 3
        addFriendButton.layer.borderColor = UIColor.lightGray.cgColor
        addFriendButton.layer.borderWidth = 1
        
        [postingCountLabel, followerCountLabel, followingCountLabel]
            .forEach{ $0.text = "\(Int.random(in: 0...10))" }
    }
}
