//
//  CategoryTVC+CollectionView.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 15/08/23.
//

import Foundation
import UIKit

//MARK: UICollectionViewDataSource
extension MainTVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if typeOfCollection == .category {
            return categories.count
        } else {
            return folders.count
        }
       }
       
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if typeOfCollection == .category {
            guard let cellForCategory = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCVC.identifier, for: indexPath) as? CategoryCVC else { return UICollectionViewCell() }
            cellForCategory.updateCell(
                name: categories[indexPath.item].nameCategory ?? "Unnamed category",
                color: categories[indexPath.item].colorCategory ?? "",
                isFavourity: categories[indexPath.item].isFavourity,
                false, false
            )
            
            cellForCategory.backgroundColor = .clear
            
            return cellForCategory
        } else if typeOfCollection == .folder {
            guard let cellForFolder = collectionView.dequeueReusableCell(withReuseIdentifier: FolderCVC.identifire, for: indexPath) as? FolderCVC else { return UICollectionViewCell() }
            cellForFolder.updateCell(folders[indexPath.item].name ?? "Unnamed folder")
            cellForFolder.backgroundColor = .clear
            
            return cellForFolder
        }
        return UICollectionViewCell()
        
    }
}

//MARK: UICollectionViewDelegate
extension MainTVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if typeOfCollection == .category {
            openVcDelegate.openTasksVC(
                indexPath.row,
                categories[indexPath.row].nameCategory ?? "Unname category"
            )
        } else if typeOfCollection == .folder {
            openVcDelegate.openFolderVC(
                indexPath.row,
                folders[indexPath.row].name ?? "Unnamed folder"
            )
        }
    }
}
