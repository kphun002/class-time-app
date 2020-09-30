//
//  CheckClassViewController.swift
//  ClassTime
//
//  Created by Karol Phung on 9/26/20.
//

import UIKit
import SearchTextField

class CheckClassViewController: UIViewController {

    @IBOutlet weak var courseCode: SearchTextField!
    @IBOutlet weak var hours: UILabel!
    @IBOutlet weak var addToSchedule: UIButton!
    @IBOutlet weak var seeSchedule: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var searchButton: UIButton!
    
    var selectedCourses: [String:Double] = [:]
    
    let myCourseInfoModel = CourseInfoModel.sharedCourseInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchButton.layer.cornerRadius = 8.0
        addToSchedule.layer.cornerRadius = 10.0
        seeSchedule.layer.cornerRadius = 10.0
        errorLabel.isHidden = true

        var registeredCourses: [String] = []
        for course in myCourseInfoModel.courses {
            registeredCourses.append(course.key)
        }
        courseCode.filterStrings(registeredCourses)
    }
    
    @IBAction func tapOnSearchCourse(_ sender: Any) {
        
        hours.text = "0"
        
        if !validateCourse(field: courseCode.text!){
            errorLabel.textColor = UIColor.red
            errorLabel.isHidden = false
            errorLabel.text = "Please enter a valid course ID"
            errorLabel.errorShake()
        }
        else {
            hours.text = String(myCourseInfoModel.averageForCourse(courseName: courseCode.text!))
            errorLabel.isHidden = true
        }
    }
    
    @IBAction func tapOnAddToSchedule(_ sender: Any) {
        if ((hours.text == "0") || !validateCourse(field: courseCode.text!)) {
            errorLabel.text = "Course or hours invalid"
            errorLabel.textColor = UIColor.red
            errorLabel.isHidden = false
            errorLabel.errorShake()
        }
        else {
        selectedCourses[courseCode.text!] = Double(hours.text!)
        errorLabel.isHidden = false
        errorLabel.textColor = UIColor.green
        errorLabel.text = "Class added!"
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let scheduleViewController = segue.destination as? ScheduleViewController
        scheduleViewController?.coursesInSchedule = selectedCourses
    }

}

extension CheckClassViewController {
    func validateCourse(field: String) -> Bool{
        return myCourseInfoModel.checkCourseID(courseName: field)
    }
}


