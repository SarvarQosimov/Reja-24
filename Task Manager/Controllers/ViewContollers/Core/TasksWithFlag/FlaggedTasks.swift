//
//  TodayTasks.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 27/07/23.
//

import UIKit
import CoreData

class FlaggedTasks: UIViewController {
   
    //MARK: Elements
    var tableView: UITableView!
    var noTasksLbl = UILabel()
    
    //MARK: Variables
    var contex = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var flaggedTasks       = [TaskDB]()
    var flaggedTasksIndexs = [Int]()
    var tasks              =  [TaskDB]()
    var viewModel          = TasksViewModel()
    
    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        TasksForTodayTVC.role = .flagged
        getFlaggedTasks()
        isTaskEmpty()
    }
    
    //MARK: getTasksOfTasks
    func getFlaggedTasks(){
        tasks = viewModel.fetchTasks()
        flaggedTasks = []
        flaggedTasksIndexs = []
        
        for task in tasks.enumerated() where task.element.isFlagged {
            flaggedTasks.append(task.element)
            flaggedTasksIndexs.append(task.offset)
        }

        tableView.reloadData()
    }
    
    //MARK: isTaskEmpty
    func isTaskEmpty(){
        if flaggedTasks.count == 0 {
            noTasksLbl.isHidden = false
        } else {
            noTasksLbl.isHidden = true
        }
    }
}


