//
//  ScheduleViewController.swift
//  ClassTime
//
//  Created by Karol Phung on 9/26/20.
//

import UIKit

class ScheduleViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var scheduleTableView: UITableView!
    @IBOutlet weak var totalHours: UILabel!
    
    var coursesInSchedule: [String:Double] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scheduleTableView.delegate = self
        scheduleTableView.dataSource = self
        var courseTotal : Double = 0
        for courses in coursesInSchedule{
            courseTotal = courses.value + courseTotal
        }
        totalHours.text = String(courseTotal)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coursesInSchedule.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = scheduleTableView.dequeueReusableCell(withIdentifier: "CourseViewCell") as! CourseViewCell
        
        cell.courseCode.text = Array(coursesInSchedule.keys)[indexPath.row]
        cell.hours.text = String(Array(coursesInSchedule.values)[indexPath.row])
        
        return cell
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
