//
//  ScheduleViewController.swift
//  ClassTime
//
//  Created by Karol Phung on 9/26/20.
//

import UIKit

protocol ScheduleViewControllerDelegate: class {
    func didDeleteRowAt(index: Int)
}

class ScheduleViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var scheduleTableView: UITableView!
    @IBOutlet weak var totalHours: UILabel!
    @IBOutlet weak var emailButton: UIButton!
    
    var coursesInSchedule: [String:Double] = [:]
    
    weak var delegate: ScheduleViewControllerDelegate?
    
    private func updateTotal() {
        var courseTotal : Double = 0
        for courses in coursesInSchedule{
            courseTotal = courses.value + courseTotal
        }
        totalHours.text = String(courseTotal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scheduleTableView.tableFooterView = UIView()
        scheduleTableView.delegate = self
        scheduleTableView.dataSource = self
        emailButton.layer.cornerRadius = 10.0
        updateTotal()
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
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            coursesInSchedule.removeValue(forKey: Array(coursesInSchedule.keys)[indexPath.row])
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
            updateTotal()
            delegate?.didDeleteRowAt(index: indexPath.row)
        }
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
