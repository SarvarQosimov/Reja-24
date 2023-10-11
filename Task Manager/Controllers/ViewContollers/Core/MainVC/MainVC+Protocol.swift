//
//  MainVC+Protocol.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 15/08/23.
//

import Foundation
import UIKit

extension MainVC: OpenViewControllerDelegate {
    
    func openTaskDetailVC(_ task: TaskDB) {
        let vc = TaskDetailVC()
        vc.hidesBottomBarWhenPushed = true
        vc.updateView(task)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func openSetTimerVC(_ index: Int) {
        let vc = SetTimer()
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    
    func openEditVC() {
        let vc = AddTaskVC()
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    
    func openCreateNewCategoryVC() {
        let vc = CreateNewCategory()
        vc.index = nil
        vc.hidesBottomBarWhenPushed = true
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    
    func openAllCategoriesVC() {
        let vc = CategoryVC()
        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func openAllFoldersVC() {
        let vc = AllFoldersVC()
        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func openCreateNewFolderVC() {
        presentNewFolderAlert()
    }
    func openTasksVC(_ indexOfCategory: Int, _ titleOfCategory: String) {
        let vc = TasksVC()
        TasksVC.whichCategory = indexOfCategory
        TasksVC.titleOfCategory = titleOfCategory
        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func openFolderVC(_ indexOfFolder: Int, _ titleOfFolder: String) {
        let vc = FolderVC()
        vc.title = titleOfFolder
        FolderVC.whichFolder = indexOfFolder
        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: true)
    }
}

