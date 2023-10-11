//
//  MainTVC+Protocol.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 21/08/23.
//

import Foundation

extension MainTVC: DataChangedDelegate {
    func tasksChanged() {
        //tasks updated
    }
    
    func categoriesChanged() {
        self.categories = categoryViewModel.fetchCategories()
        self.collectionView.reloadData()
    }
    
    func foldersChanged() {
        self.folders = folderViewModel.fetchFolders()
        self.collectionView.reloadData()
    }
}
