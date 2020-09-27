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
    
    var selectedCourses: [String:Double] = [:]
    
    let myCourseInfoModel = CourseInfoModel.sharedCourseInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var registeredCourses: [String] = []
        for course in myCourseInfoModel.courses {
            registeredCourses.append(course.key)
        }
        courseCode.filterStrings(registeredCourses)
    }
    
    @IBAction func tapOnSearchCourse(_ sender: Any) {
        hours.text = String(myCourseInfoModel.averageForCourse(courseName: courseCode.text!))
    }
    
    @IBAction func tapOnAddToSchedule(_ sender: Any) {
        selectedCourses[courseCode.text!] = Double(hours.text!)
        print(selectedCourses)
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
