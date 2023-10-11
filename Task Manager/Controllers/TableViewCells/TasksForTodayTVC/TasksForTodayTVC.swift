//
//  TasksForTodayTVC.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 15/08/23.
//

import UIKit
import CoreData

class TasksForTodayTVC: UITableViewCell {
    
    var tableView: UITableView!
    let openCloseBtn = UIButton()
    let contex = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let taskViewModel = TasksViewModel()
    var isOpen = true
    static let identifire: String = String(describing: TasksForTodayTVC.self)
    var tasksOfToday = [TaskDB]()
    var todayIndex = [Int]()
    var tasks =  [TaskDB]()
    static var role: typeOfTaskTVC = .today
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        tasks = taskViewModel.fetchTasks()
        getTasksOfToday()
        setupTableView()
        TasksVC.delegate = self
        ScheduledTasksVC.delegate = self
        SearchTasksVC.taskUpdatedDelegate = self
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    //MARK: openCloseBtnPressed
    @objc func openCloseBtnPressed(_ sender: Any){
        if isOpen {
            openCloseBtn.setTitle("\(SetLanguage.setLanguage(.tasksForToday)) ›", for: .normal)
            self.tableView.isHidden = true
            isOpen = false
        } else {
            openCloseBtn.setTitle("\(SetLanguage.setLanguage(.tasksForToday)) ⌄", for: .normal)
            isOpen = true
            self.tableView.isHidden = false
        }
        
    }

    //MARK: getTasksOfTasks
    func getTasksOfToday(){
        tasks = taskViewModel.fetchTasks()
        tasksOfToday = []
        todayIndex = []
        let currentDay = Calendar.current.component(.day, from: Date())
        for i in tasks.enumerated() {
            if !(i.element.dedline ?? "").isEmpty {
                if findDayOfDedline(i.element.dedline!) == currentDay {
                    tasksOfToday.append(i.element)
                    todayIndex.append(i.offset)
                }
            }
        }
        tableView.reloadData()
    }
    
    //MARK: findDayOfDedline
    func findDayOfDedline(_ dedline: String) -> Int{
        var index = ""
        for i in dedline.enumerated() {
            if i.offset == 8 || i.offset == 9 {
                index.append(i.element)
            }
        }
        return Int(index) ?? 0
    }
}


