//
//  TaskDetailVC.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 29/08/23.
//

import UIKit

class TaskDetailVC: UIViewController {

    //MARK: Elements
    let taskImage  = UIImageView()
    let taskLbl    = UILabel()
    let taskName   = UILabel()
    let noteLbl    = UILabel()
    let note       = UILabel()
    let stack      = UIStackView()
    let stack1     = UIStackView()
    let stack2     = UIStackView()
    let doneLbl    = UILabel()
    let isDone     = UISwitch()
    let datePicker = UIDatePicker()
    let calendar   = Calendar.current
    
    //MARK: Variables
    var dateComponents = DateComponents()
    var yearString     = ""
    var monthString    = ""
    var dayString      = ""
    var hourString     = ""
    var minuteString   = ""
    
    //MARK: Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        datePicker.isEnabled = false
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        TasksVC.isTaskDetail = false
    }
    
    //MARK: updateView
    func updateView(_ data: TaskDB){
        if let img = data.image?.toImage() {
            taskImage.image = img
        } else {
            taskImage.image = UIImage(named: "noimage")
        }
        
        taskName.text = " \(data.task ?? "no task") "
        note.text = data.note
        
        switch data.priority {
        case "High": taskName.layer.borderColor = UIColor.red.cgColor
        case "Medium": taskName.layer.borderColor = UIColor.systemYellow.cgColor
        default: taskName.layer.borderColor = UIColor.systemGreen.cgColor
        }
        
        if data.isDone {
            self.isDone.isOn = true
        } else {
            self.isDone.isOn = false
        }
        setupDatePicker(data.dedline ?? "")
    }
    
    //MARK: setupDatePicker
    func setupDatePicker(_ taskTime: String) {
        if taskTime.isEmpty {
            datePicker.isHidden = true
        }
        
        for i in taskTime.enumerated() {
            if i.offset < 4 {
                yearString.append(i.element)
            } else if i.offset == 5 || i.offset == 6 {
                monthString.append(i.element)
            } else if i.offset == 8 || i.offset == 9 {
                dayString.append(i.element)
            } else if i.offset == 14 || i.offset == 15 {
                hourString.append(i.element)
            } else if i.offset == 17 || i.offset == 18 {
                minuteString.append(i.element)
            }
        }
        
        dateComponents.year = Int(yearString)
        dateComponents.month = Int(monthString)
        dateComponents.day = Int(dayString)
        dateComponents.hour = Int(hourString)
        dateComponents.minute = Int(minuteString)
        
        if let customDate = calendar.date(from: dateComponents) {
            datePicker.date = customDate
        } else {
            print("error")
        }
    }
    
}
