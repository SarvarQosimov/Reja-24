//
//  TasksVC+TableView.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 25/07/23.
//

import Foundation
import UIKit

//MARK: setupTableView
extension TasksVC {
    func setupTableView(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TaskTVC.self, forCellReuseIdentifier: TaskTVC.identifire)
    }
}

//MARK: UITableViewDataSource
extension TasksVC: UITableViewDataSource {
    //MARK: numberOfRowsInSection
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        taskOnly.count
    }
    
    //MARK: cellForRowAt
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TaskTVC.identifire, for: indexPath) as? TaskTVC else { return UITableViewCell()}
        if taskOnly.count != 0 {
            cell.updateCell(
                task     : taskOnly[indexPath.row].task!,
                isDone   : taskOnly[indexPath.row].isDone,
                priority : taskOnly[indexPath.row].priority!,
                dedline  : taskOnly[indexPath.row].dedline!,
                img      : taskOnly[indexPath.row].image ?? "",
                isFlagged: taskOnly[indexPath.row].isFlagged
            )
            TaskTVC.finishDelegate = self
            cell.role = .main
            cell.indexForMain = indexPath.row
        }
        cell.backgroundColor = Constants.mainBackgroundColor
        cell.selectionStyle = .none
        return cell
    }
}

//MARK: UITableViewDelegate
extension TasksVC: UITableViewDelegate {
    
    //MARK: trailingSwipeActionsConfigurationForRowAt
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let contextual = UIContextualAction(
            style: .destructive,
            title: SetLanguage.setLanguage(.deleteTask))
        { [self] _, _, _ in
            taskViewModel.deleteTask(
                indexPathRow: indexPath.row,
                selectedIndex: selectedIndex
            )
            taskViewModel.save()
            sortingTasks()
            tableView.reloadData()
        }
        contextual.image = UIImage(systemName: "trash")
        let swipe = UISwipeActionsConfiguration(actions: [contextual])
        
        return swipe
    }
    
    //MARK: leadingSwipeActionsConfigurationForRowAt
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .normal, title: SetLanguage.setLanguage(.setDedline)) { [self] _, _, _ in
            SetTimer.title     = taskOnly[indexPath.row].task!
            SetTimer.priority  = taskOnly[indexPath.row].priority!
            SetTimer.beforSet  = taskOnly[indexPath.row]
            SetTimer.whichTask = findSelectedIndex(index: indexPath.row)
            
            let vc = SetTimer()
            SetTimer.delegate = self
            present(vc, animated: true)
        }
        action.backgroundColor = .systemBlue
        action.image = UIImage(systemName: "clock")
        let configuration = UISwipeActionsConfiguration(actions: [action])
        
        return configuration
    }
    
    //MARK: contextMenuConfigurationForRowAt
    func tableView(_ tableView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        let edit = UIAction(title: SetLanguage.setLanguage(.editTask)) { [self] _ in
            taskViewModel.taskIsEditing(selectedIndex: selectedIndex, index: indexPath.row)
            AddTaskVC.delegate = self
            
            let vc = AddTaskVC()
            vc.modalPresentationStyle = .overFullScreen
            present(vc, animated: true)
        }
        edit.image = UIImage(systemName: "pencil")
        
        return UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { _ in
            return UIMenu(title: "",children: [edit])
        }
    }
    
    //MARK: didSelectRowAt
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        TasksVC.isTaskDetail = true
        let vc = TaskDetailVC()
        vc.updateView(taskOnly[indexPath.row])
        navigationController?.pushViewController(vc, animated: true)
    }
}


