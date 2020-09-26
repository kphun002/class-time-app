//
//  SubmissionViewController.swift
//  ClassTime
//
//  Created by Reiner Gonzalez on 9/26/20.
//

import UIKit

class SubmissionViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var courseCodeField: UITextField!
    @IBOutlet weak var hoursField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        errorLabel.isHidden = true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        errorLabel.isHidden = true
    }
    @IBAction func backGroundTap(_ sender: Any) {
        hoursField.resignFirstResponder()
        courseCodeField.resignFirstResponder()
    }
    
    
    @IBAction func submitPressed(_ sender: Any) {
        if !validateFields(){
            errorLabel.isHidden = false
            errorLabel.text = "Please fill all fields"
            errorLabel.errorShake()
        }
        else{
            errorLabel.isHidden = true
            //add field to DB
        }
    }
    
}

extension SubmissionViewController {
    
    func validateFields() -> Bool{
        if (courseCodeField.text!.isEmpty || hoursField.text!.isEmpty){
            return false
        }
        else {
            return true
        }
    }
    
}
