//
//  CategoryVC+Protocol.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 07/10/23.
//

import Foundation

extension CategoryVC: DataChangedDelegate {
    func tasksChanged() {
        // update tasks
    }
    
    func categoriesChanged() {
        self.categories = categoryViewModel.fetchCategories()
        collectionView.reloadData()
    }
    
    func foldersChanged() {
        // update folders
    }
    
    
}
