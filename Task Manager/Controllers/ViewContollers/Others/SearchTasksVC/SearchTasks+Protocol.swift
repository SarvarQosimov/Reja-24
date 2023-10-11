//
//  SearchTasks+Protocol.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 31/08/23.
//

import Foundation
import UIKit

//MARK: DataChangedDelegate
extension SearchTasksVC: DataChangedDelegate {
    func foldersChanged() {
        // folders updated
    }
    
    func categoriesChanged() {
        // categories updated
    }
    
    func tasksChanged() {
        updateSearch()
    }
}

//MARK: FinishedDelegate
extension SearchTasksVC: FinishedDelegate {
    func isDone(_ index: Int) {
        searchedTasks[index].isDone = !searchedTasks[index].isDone
        viewModel.save()
        tasks = viewModel.fetchTasks()
        searchedTasks[index] = tasks[searchingIndex[index]]
        tableView.reloadData()
    }
}
