//
//  TodayTasks+TableView.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 04/08/23.
//

import UIKit

//MARK: setupTableView
extension TasksForTodayTVC {
    func setupTableView(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TaskTVC.self, forCellReuseIdentifier: TaskTVC.identifire)
    }
}

//MARK: UITableViewDelegate
extension TasksForTodayTVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: SetLanguage.setLanguage(.deleteTask)) { [self] _, _, _ in
            contex.delete(tasksOfToday[indexPath.row])
            tasksOfToday.remove(at: indexPath.row)
            tableView.reloadData()
            taskViewModel.save()
        }
        
        let dedline = UIContextualAction(style: .normal, title: SetLanguage.setLanguage(.setDedline)) { [self] _, _, _ in
            SetTimer.title = tasksOfToday[indexPath.row].task!
            SetTimer.priority = tasksOfToday[indexPath.row].priority!
            SetTimer.beforSet = tasksOfToday[indexPath.row]
            SetTimer.whichTask = todayIndex[indexPath.row]
            SetTimer.delegate = self
            openVcDelegate.openSetTimerVC(todayIndex[indexPath.row])
        }
        
        let swipe = UISwipeActionsConfiguration(actions: [delete,dedline])
        
        return swipe
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        openVcDelegate.openTaskDetailVC(tasksOfToday[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {

                let edit = UIAction(title: SetLanguage.setLanguage(.editTask)) { [self]_ in
                    AddTaskVC.isEditing = (
                        true,
                        tasksOfToday[indexPath.row],
                        todayIndex[indexPath.row]
                    )
                    AddTaskVC.delegate = self
                    openVcDelegate.openEditVC()
                    
                }
                edit.image = UIImage(systemName: "pencil")
                return UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { _ in
                    return UIMenu(title: "",children: [edit])
                }

            }
    }

//MARK: UITableViewDataSource
extension TasksForTodayTVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasksOfToday.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TaskTVC.identifire, for: indexPath) as? TaskTVC else { return UITableViewCell() }
        cell.updateCell(
            task: tasksOfToday[indexPath.row].task!,
            isDone: tasksOfToday[indexPath.row].isDone,
            priority: tasksOfToday[indexPath.row].priority!,
            dedline: tasksOfToday[indexPath.row].dedline!,
            img: tasksOfToday[indexPath.row].image ?? "",
            isFlagged: tasksOfToday[indexPath.row].isFlagged
        )
        TaskTVC.finishDelegate = self
        cell.role = .today
        cell.indexForToday = todayIndex[indexPath.row]
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        
        return cell
    }
}
