//
//  CourseViewCell.swift
//  ClassTime
//
//  Created by Karol Phung on 9/26/20.
//

import UIKit

class CourseViewCell: UITableViewCell {

    @IBOutlet weak var courseCode: UILabel!
    @IBOutlet weak var hours: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func tapOnRemove(_ sender: Any) {
        
    }
}
