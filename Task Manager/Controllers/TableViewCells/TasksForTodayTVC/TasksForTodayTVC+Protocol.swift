//
//  TasksForTodayTVC+Protocol.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 21/08/23.
//

import Foundation
import UIKit

extension TasksForTodayTVC: DataChangedDelegate {
    func foldersChanged() {
        //
    }
    
    func categoriesChanged() {
        //
    }
    
    func tasksChanged() {
        tasks = taskViewModel.fetchTasks()
        getTasksOfToday()
        tableView.reloadData()
    }
    
    
}

//MARK: FinishedDelegate
extension TasksForTodayTVC: FinishedDelegate {
    func isDone(_ index: Int) {
        tasks[index].isDone = !tasks[index].isDone
        taskViewModel.save()
        tasks = taskViewModel.fetchTasks()
        tableView.reloadData()
    }
}
