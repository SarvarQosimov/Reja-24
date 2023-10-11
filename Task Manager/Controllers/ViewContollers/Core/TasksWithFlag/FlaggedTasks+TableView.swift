//
//  FlaggedTasks+TableView.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 02/09/23.
//

import Foundation
import UIKit

//MARK: setupTableView
extension FlaggedTasks {
    func setupTableView(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TaskTVC.self, forCellReuseIdentifier: TaskTVC.identifire )
    }
}

//MARK: UITableViewDataSource
extension FlaggedTasks: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flaggedTasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TaskTVC.identifire, for: indexPath) as? TaskTVC else { return UITableViewCell() }
        cell.updateCell(
            task: flaggedTasks[indexPath.row].task!,
            isDone: flaggedTasks[indexPath.row].isDone,
            priority: flaggedTasks[indexPath.row].priority!,
            dedline: flaggedTasks[indexPath.row].dedline!,
            img: flaggedTasks[indexPath.row].image ?? "",
            isFlagged: flaggedTasks[indexPath.row].isFlagged
        )
        TaskTVC.finishDelegate = self
        cell.role = .flagged
        cell.indexForFlagged = indexPath.row
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        
        return cell
    }
}

//MARK: UITableViewDelegate
extension FlaggedTasks: UITableViewDelegate {
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: SetLanguage.setLanguage(.deleteTask)) { [self] _, _, _ in
            contex.delete(flaggedTasks[indexPath.row])
            viewModel.save()
            getFlaggedTasks()
            isTaskEmpty()
        }
        
        let dedline = UIContextualAction(style: .normal, title: SetLanguage.setLanguage(.setDedline)) { [self] _, _, _ in
            SetTimer.title = flaggedTasks[indexPath.row].task!
            SetTimer.priority = flaggedTasks[indexPath.row].priority!
            SetTimer.beforSet = flaggedTasks[indexPath.row]
            SetTimer.whichTask = flaggedTasksIndexs[indexPath.row]
            SetTimer.delegate = self
            let vc = SetTimer()
            vc.modalPresentationStyle = .overFullScreen
            present(vc, animated: true)
        }
        
        let swipe = UISwipeActionsConfiguration(actions: [delete,dedline])
        
        return swipe
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = TaskDetailVC()
        vc.hidesBottomBarWhenPushed = true
        vc.updateView(flaggedTasks[indexPath.row])
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        
        let edit = UIAction(title: SetLanguage.setLanguage(.editTask)) { [self]_ in
            AddTaskVC.isEditing = (
                true,
                flaggedTasks[indexPath.row],
                flaggedTasksIndexs[indexPath.row]
            )
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
}
