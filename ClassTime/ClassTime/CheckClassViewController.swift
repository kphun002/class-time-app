//
//  CheckClassViewController.swift
//  ClassTime
//
//  Created by Karol Phung on 9/26/20.
//

import UIKit

class CheckClassViewController: UIViewController {

    @IBOutlet weak var courseCode: UITextField!
    @IBOutlet weak var hours: UILabel!
    @IBOutlet weak var addToSchedule: UIButton!
    
    var selectedCourses: [String:Int] = [:]
    
    let myCourseInfoModel = CourseInfoModel.sharedCourseInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func tapOnSearchCourse(_ sender: Any) {
        hours.text = String(myCourseInfoModel.averageForCourse(courseName: courseCode.text!))
    }
    
    @IBAction func tapOnAddToSchedule(_ sender: Any) {
        selectedCourses[courseCode.text!] = Int(hours.text!)
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
