//
//  SecondViewController.swift
//  Protocol
//
//  Created by 김서윤 on 5/3/24.
//

import UIKit

class SecondViewController: UIViewController, ChangeLableDelegate {
    func doChange() {
        previousViewController?.label.text = self.textField.text
    }

    @IBOutlet weak var textField: UITextField!
    var previousViewController : ViewController?
    
    @IBAction func buttonDismiss(_ sender: Any) {
        doChange()
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        previousViewController?.delegate = self
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
