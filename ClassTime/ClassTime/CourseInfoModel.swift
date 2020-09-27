//
//  CourseInfoModel.swift
//  ClassTime
//
//  Created by Reiner Gonzalez on 9/26/20.
//

import Foundation

final class CourseInfoModel {
    
    struct course{
        var hours: Int
        var ratings: Int
    }
    
    static let sharedCourseInstance = CourseInfoModel()
    
    var courses = ["COP 2210": course(hours: 50, ratings: 5),
                        "COP 3337": course(hours: 14, ratings: 2),
                        "COP 4338": course(hours: 95, ratings: 10),
                        "COT 3100": course(hours: 120, ratings: 11),
                        "CDA 4101": course(hours: 108, ratings: 12),
                        "COP 4610": course(hours: 150, ratings: 13),
                        "CNT 4713": course(hours: 180, ratings: 15),
                        "CEN 4010": course(hours: 242, ratings: 25),
                        "CIS 4911": course(hours: 47, ratings: 5)]
    
    //checks for the course in the dictionary based off the name that is passed
    func checkCourseID(courseName: String) -> Bool{
        return courses.keys.contains(courseName)
    }
    
    //increments the hours for one of the courses in the dicionary
    func newSubmittion(courseID: String, userHours: Int){
        let tempCourse = courses[courseID]
        courses[courseID] = course(hours: tempCourse!.hours + userHours, ratings: tempCourse!.ratings + 1)
        print(courses[courseID]!)
    }
    
    //calculate average for requested course
    func averageForCourse(courseName: String) -> Double{
        return Double(courses[courseName]!.hours / courses[courseName]!.ratings)
    }
}
