//
//  SearchTasksVC.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 30/08/23.
//

import UIKit

class SearchTasksVC: UIViewController {
    
    let searchTF         = UITextField()
    var tableView:         UITableView!
    var customBackButton = UIBarButtonItem()

    let contex = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var searchedTasks  = [TaskDB]()
    var searchingIndex = [Int]()
    var tasks          = [TaskDB]()
    let viewModel      = TasksViewModel()
    var serchingText   = ""
    static var taskUpdatedDelegate: DataChangedDelegate!
    
    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        TasksForTodayTVC.role = .searched
        TaskTVC.finishDelegate = self
        setupViews()
        setupTableView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if !TasksVC.isTaskDetail {
            TasksForTodayTVC.role = .today
            SearchTasksVC.taskUpdatedDelegate.tasksChanged()
        }
    }
    
    @objc func donePressed(_ sender: Any){
        searchTF.resignFirstResponder()
    }
    
    //MARK: updateSearch
    func updateSearch(){
        tasks = viewModel.fetchTasks()
        searchedTasks = []
        searchingIndex = []
        let text = serchingText.lowercased()
        for i in tasks.enumerated() {
            if let iTask = i.element.task?.lowercased() {
                if iTask.contains(text) {
                    searchedTasks.append(i.element)
                    searchingIndex.append(i.offset)
                }
            } else {
                print("nil")
            }
        }
        tableView.reloadData()
    }
}

//MARK: UISearchBarDelegate
extension SearchTasksVC: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        tasks = viewModel.fetchTasks()
    }

    func textFieldDidChangeSelection(_ textField: UITextField) {
        serchingText = textField.text ?? ""
        searchedTasks = []
        searchingIndex = []
        let text = serchingText.lowercased()
        for i in tasks.enumerated() {
            if let iTask = i.element.task?.lowercased() {
                if iTask.contains(text) {
                    searchedTasks.append(i.element)
                    searchingIndex.append(i.offset)
                }
            } else {
                print("nil")
            }
        }
        tableView.reloadData()
    }
    
}
