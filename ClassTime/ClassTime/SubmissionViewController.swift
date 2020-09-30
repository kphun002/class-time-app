//
//  SubmissionViewController.swift
//  ClassTime
//
//  Created by Reiner Gonzalez on 9/26/20.
//

import UIKit
import SearchTextField

class SubmissionViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var courseCodeField: SearchTextField!
    @IBOutlet weak var hoursField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var submitButton: UIButton!
    let myCourseInfoModel = CourseInfoModel.sharedCourseInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        submitButton.layer.cornerRadius = 10.0
        errorLabel.isHidden = true
        var registeredCourses: [String] = []
        for course in myCourseInfoModel.courses {
            registeredCourses.append(course.key)
        }
        courseCodeField.filterStrings(registeredCourses)
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

    func textFieldDidBeginEditing(_ textField: UITextField) {
        errorLabel.isHidden = true
    }
    
    @IBAction func backGroundTap(_ sender: Any) {
        hoursField.resignFirstResponder()
        courseCodeField.resignFirstResponder()
    }
    
    
    @IBAction func submitPressed(_ sender: Any) {
        if !validateFields(){
            errorLabel.textColor = UIColor.red
            errorLabel.isHidden = false
            errorLabel.text = "Please fill all fields"
            errorLabel.errorShake()
        }
        else if !validateCourse(field: courseCodeField.text!){
            errorLabel.textColor = UIColor.red
            errorLabel.isHidden = false
            errorLabel.text = "Please enter a valid course ID"
            errorLabel.errorShake()
        }
        else if Int(hoursField.text!)! > 40 {
            errorLabel.textColor = UIColor.red
            errorLabel.isHidden = false
            errorLabel.text = "Please enter a valid number of hours"
            errorLabel.errorShake()
        }
        else{
            //add field to DB
            myCourseInfoModel.newSubmittion(courseID: courseCodeField.text!, userHours: Int(hoursField.text!)!)
            errorLabel.textColor = UIColor.green
            errorLabel.isHidden = false
            errorLabel.text = "Thank you for your submission!"
            errorLabel.errorShake()
            
        }
    }
    
}

extension SubmissionViewController {
    
    func validateFields() -> Bool{
        return !(courseCodeField.text!.isEmpty || hoursField.text!.isEmpty)
    }
    
    func validateCourse(field: String) -> Bool{
        return myCourseInfoModel.checkCourseID(courseName: field)
    }
    
}
