//
//  FlaggedTasks+Protocol.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 02/09/23.
//

import Foundation
import UIKit

extension FlaggedTasks: FinishedDelegate {
    func isDone(_ index: Int) {
        flaggedTasks[index].isDone = !flaggedTasks[index].isDone
        viewModel.save()
        getFlaggedTasks()
    }
}

extension FlaggedTasks: DataChangedDelegate {
    func foldersChanged() {
        // update folder
    }
    
    func categoriesChanged() {
        // update category
    }
    
    func tasksChanged() {
        getFlaggedTasks()
        isTaskEmpty()
    }
    
    
}
