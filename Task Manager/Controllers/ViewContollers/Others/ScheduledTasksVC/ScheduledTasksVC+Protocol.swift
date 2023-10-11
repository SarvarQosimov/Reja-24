//
//  ScheduledTasksVC+Protocol.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 07/10/23.
//

import Foundation
import UIKit

extension ScheduledTasksVC: DataChangedDelegate {
    func foldersChanged() {
        // update folders
    }
    
    func categoriesChanged() {
        // update categories
    }
    
    func tasksChanged() {
        sortByDate()
        taskViewModel.save()
    }
    
    
}

extension ScheduledTasksVC: FinishedDelegate {
    func isDone(_ index: Int) {
        tasks[index].isDone = !tasks[index].isDone
        taskViewModel.save()
        tasks = taskViewModel.fetchTasks()
        sortByDate()
        tableView.reloadData()
    }
}
