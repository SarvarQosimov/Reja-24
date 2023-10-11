//
//  SchedualTasks+TableView.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 04/08/23.
//

import UIKit

//MARK: setupTableView
extension ScheduledTasksVC {
    func setupTableView(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TaskTVC.self, forCellReuseIdentifier: TaskTVC.identifire)
    }
}

//MARK: UITableViewDataSource
extension ScheduledTasksVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasksWithDedline.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TaskTVC.identifire, for: indexPath) as? TaskTVC else { return UITableViewCell()}
        cell.updateCell(
            task      : tasksWithDedline[indexPath.row].task!,
            isDone    : tasksWithDedline[indexPath.row].isDone,
            priority  : tasksWithDedline[indexPath.row].priority!,
            dedline   : tasksWithDedline[indexPath.row].dedline!,
            img       : tasksWithDedline[indexPath.row].image ?? "",
            isFlagged : tasksWithDedline[indexPath.row].isFlagged
        )
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        cell.indexForSchedualed = dedlineIndex[indexPath.row]
        cell.role = .schedualed
        
        return cell
    }
}

//MARK: UITableViewDelegate
extension ScheduledTasksVC: UITableViewDelegate {
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        TasksVC.isTaskDetail = true
        openVcDelegate.openTaskDetailVC(tasksWithDedline[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
      
        let delete = UIContextualAction(style: .destructive, title: SetLanguage.setLanguage(.deleteTask)) { [self] _, _, _ in
            contex.delete(tasksWithDedline[indexPath.row])
            tasksWithDedline.remove(at: indexPath.row)
            tableView.reloadData()
            taskViewModel.save()
            isTasksEmpty()
        }
        
        let dedline = UIContextualAction(style: .normal, title: SetLanguage.setLanguage(.setDedline)) { [self] _, _, _ in
            SetTimer.title = tasksWithDedline[indexPath.row].task!
            SetTimer.priority = tasksWithDedline[indexPath.row].priority!
            SetTimer.beforSet = tasksWithDedline[indexPath.row]
            SetTimer.whichTask = dedlineIndex[indexPath.row]
            
            let vc = SetTimer()
            SetTimer.delegate = self
            present(vc, animated: true)
        }
        
        let swipe = UISwipeActionsConfiguration(actions: [delete,dedline])
        
        return swipe
    }
    
    func tableView(_ tableView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        
        let edit = UIAction(title: SetLanguage.setLanguage(.editTask)) { [self]_ in
            AddTaskVC.isEditing = (true,tasksWithDedline[indexPath.row], dedlineIndex[indexPath.row])
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
