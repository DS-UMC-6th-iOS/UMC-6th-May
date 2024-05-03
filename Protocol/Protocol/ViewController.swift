//
//  ViewController.swift
//  Protocol
//
//  Created by 김서윤 on 5/3/24.
//

import UIKit

protocol ChangeLableDelegate {
    func doChange()
}

class ViewController: UIViewController {

    @IBOutlet var label: UILabel!
    @IBAction func buttonGoNextVC(_ sender: Any) {
        guard let nextVC = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else {
            return
        }
        nextVC.previousViewController = self
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated: true, completion: nil)
    }
    
    var delegate : ChangeLableDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

