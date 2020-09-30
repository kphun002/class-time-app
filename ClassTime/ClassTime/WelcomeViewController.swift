//
//  WelcomeViewController.swift
//  ClassTime
//
//  Created by Karol Phung on 9/30/20.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var rateButton: UIButton!
    @IBOutlet weak var checkButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        rateButton.layer.cornerRadius = 10.0
        checkButton.layer.cornerRadius = 10.0
        
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
