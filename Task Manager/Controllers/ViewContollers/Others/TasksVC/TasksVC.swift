//
//  TasksVC.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 05/07/23.
//

import UIKit
import CoreData

class TasksVC: UIViewController {

    var tableView : UITableView!
    let segment   = UISegmentedControl()
    let addBtn    = UIButton()
    
    //MARK: VARIABLES
    var taskViewModel = TasksViewModel()
    static var whichCategory   = 0
    var selectedIndex          = 0
    static var titleOfCategory = ""
    var taskOnly               = [TaskDB]()
    var sortedTasks            = [TaskDB]()
    static var isTaskDetail    = false
    static var delegate        : DataChangedDelegate!
    
    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        TasksForTodayTVC.role = .main
        setupViews()
        setupTableView()
        sortingTasks()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if !TasksVC.isTaskDetail {
            TasksForTodayTVC.role = .today
            TasksVC.delegate.tasksChanged()
        }
    }
    
    //MARK: segmentAction
    @objc func segmentAction(_ sender: UISegmentedControl){
        selectedIndex = sender.selectedSegmentIndex
        sortingTasks()
    }
    
    @objc func addTaskPressed(_ sender: Any){
        let vc = AddTaskVC()
        AddTaskVC.delegate = self
        taskViewModel.taskIsNotEditing()
        
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    
    //MARK: sortingTasks
    func sortingTasks(){
        taskOnly = taskViewModel.sortingTasks(selectedIndex)
        if taskOnly.count >= 0 {
            tableView.reloadData()
        }
    }
    
    //MARK: findSelectedIndex
    func findSelectedIndex(index: Int) -> Int {
        taskViewModel.findSelectedIndex(selectedIndex: selectedIndex, index: index)
    }
}


