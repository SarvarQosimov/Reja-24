//
//  Protols.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 06/07/23.
//

import Foundation
import UIKit

var openVcDelegate: OpenViewControllerDelegate!

protocol CategoriesInFolderDelegate {
    func getCategories(_ selectedIndexs: [Int])
}

/// Delegate to notify about task is finished ot not
protocol FinishedDelegate {
    func isDone(_ index: Int)
}

///` new protocols after review code

protocol OpenViewControllerDelegate {
    func openAllCategoriesVC()
    func openAllFoldersVC()
    func openCreateNewCategoryVC()
    func openCreateNewFolderVC()
    func openTasksVC(_ indexOfCategory: Int, _ titleOfCategory: String)
    func openFolderVC(_ indexOfFolder: Int, _ titleOfFolder: String)
    
    func openTaskDetailVC(_ task: TaskDB)
    func openSetTimerVC(_ index: Int)
    func openEditVC()

}

protocol DataChangedDelegate {
    func foldersChanged()
    func categoriesChanged()
    func tasksChanged()
}

//MARK: enum
enum typeOfCollection {
    case category, folder
}

enum openViewControllers {
    case openNewCategoryVC, openNewFolderVC, openSeeAllCategoriesVC, openSeeAllFoldersVC
}

enum typeOfTaskTVC {
    case main, today, schedualed, searched, flagged
}
