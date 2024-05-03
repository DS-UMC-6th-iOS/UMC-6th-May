//
//  ViewController.swift
//  Baemin2
//
//  Created by 김서윤 on 5/3/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var header: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        header.clipsToBounds = true
        header.layer.cornerRadius = 20
        header.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMaxYCorner, .layerMaxXMaxYCorner)
    }


}

