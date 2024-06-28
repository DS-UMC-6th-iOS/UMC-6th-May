//
//  PostCollectionViewCell.swift
//  Catstagram
//
//  Created by 김서윤 on 6/28/24.
//

import UIKit

class PostCollectionViewCell: UICollectionViewCell {
    static let identifier = "PostCollectionViewCell"

    @IBOutlet var postImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func setupData() {
        // 이미지뷰의 이미지를 업로드한다.
    }

}
