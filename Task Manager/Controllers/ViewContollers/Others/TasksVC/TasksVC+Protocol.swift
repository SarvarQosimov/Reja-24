//
//  TasksVC+protocol.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 21/09/23.
//

import Foundation

//MARK: DataChangedDelegate

extension TasksVC: DataChangedDelegate {
    func foldersChanged() {
        // update folders
    }
    
    func categoriesChanged() {
        // update categories
    }
    
    func tasksChanged() {
        sortingTasks()
    }
    
}

//MARK: FinishedDelegate
extension TasksVC: FinishedDelegate {
    func isDone(_ index: Int) {
        taskViewModel.finishTask(index, selectedIndex: selectedIndex)
        sortingTasks()
        tableView.reloadData()
    }
}
