//
//  SchedualTasks.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 22/07/23.
//

import UIKit
import CoreData

class ScheduledTasksVC: UIViewController { 
    
    //MARK: Elements
    var tableView: UITableView!
    var noTasksLbl = UILabel()
    
    //MARK: VARIABLES
    let contex = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let taskViewModel    = TasksViewModel()
    var tasks            = [TaskDB]()
    var dedlineIndex     = [Int]()
    static var delegate: DataChangedDelegate!
    var tasksWithDedline = [TaskDB]() {
        didSet {
            isTasksEmpty()
        }
    }
    
    //MARK: lifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        TasksForTodayTVC.role = .schedualed
        TaskTVC.finishDelegate = self
        setupViews()
        setupTableView()
        tasks = taskViewModel.fetchTasks()
        sortByDate()
        isTasksEmpty()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if !TasksVC.isTaskDetail {
            TasksForTodayTVC.role = .today
            ScheduledTasksVC.delegate.tasksChanged()
        }
    }

    //MARK: sortByDate
    func sortByDate(){
        tasksWithDedline = []
        dedlineIndex = []
        for i in tasks.enumerated() {
            if !i.element.dedline!.isEmpty {
                tasksWithDedline.append(i.element)
                dedlineIndex.append(i.offset)
            }
        }
        tableView.reloadData()
    }
    
    //MARK: isTaskEmpty
    func isTasksEmpty(){
        if tasksWithDedline.count == 0 {
            noTasksLbl.isHidden = false
        } else {
            noTasksLbl.isHidden = true
        }
    }
}
