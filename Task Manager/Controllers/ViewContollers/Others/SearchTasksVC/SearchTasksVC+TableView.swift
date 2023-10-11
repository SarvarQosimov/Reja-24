//
//  File.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 30/08/23.
//

import Foundation
import UIKit

//MARK: setupTableView
extension SearchTasksVC {
    func setupTableView(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TaskTVC.self, forCellReuseIdentifier: TaskTVC.identifire)
    }
}

//MARK: UITableViewDataSource
extension SearchTasksVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchedTasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TaskTVC.identifire, for: indexPath) as? TaskTVC else { return UITableViewCell()}
            cell.updateCell(
                task     : searchedTasks[indexPath.row].task!,
                isDone   : searchedTasks[indexPath.row].isDone,
                priority : searchedTasks[indexPath.row].priority!,
                dedline  : searchedTasks[indexPath.row].dedline!,
                img      : searchedTasks[indexPath.row].image ?? "",
                isFlagged: searchedTasks[indexPath.row].isFlagged
            )
        cell.indexForSearched = indexPath.row
        cell.backgroundColor = Constants.mainBackgroundColor
        cell.selectionStyle = .none
        cell.role = .searched
        
        return cell
    }
}

extension SearchTasksVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        TasksVC.isTaskDetail = true
        let vc = TaskDetailVC()
        vc.updateView(searchedTasks[indexPath.row])
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        
        let edit = UIAction(title: SetLanguage.setLanguage(.editTask)) { [self]_ in
            AddTaskVC.isEditing = (true,searchedTasks[indexPath.row], searchingIndex[indexPath.row])
            AddTaskVC.delegate = self
            
            let vc = AddTaskVC()
            AddTaskVC.delegate = self
            vc.modalPresentationStyle = .overFullScreen
            present(vc, animated: true)
        }
        
        let delete = UIAction(title: SetLanguage.setLanguage(.deleteTask)) { [self] _ in
            contex.delete(tasks[searchingIndex[indexPath.row]])
            viewModel.save()
            updateSearch()
            tableView.reloadData()
        }
        
        let dedline = UIAction(title: SetLanguage.setLanguage(.setDedline)) { [self] _ in
            SetTimer.title = searchedTasks[indexPath.row].task!
            SetTimer.priority = searchedTasks[indexPath.row].priority!
            SetTimer.beforSet = searchedTasks[indexPath.row]
            SetTimer.whichTask = searchingIndex[indexPath.row]
            
            let vc = SetTimer()
            SetTimer.delegate = self
            present(vc, animated: true)
        }
        
        edit.image = UIImage(systemName: "pencil")
        delete.image = UIImage(systemName: "trash")
        dedline.image = UIImage(systemName: "clock")
                
        return UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { _ in
            return UIMenu(title: "",children: [edit, delete, dedline])
        }
        
    }
    
}


