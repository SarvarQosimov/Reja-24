//
//  CategoryVC+Extention.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 24/07/23.
//

import Foundation
import UIKit

//MARK: setupCollectionView
extension CategoryVC {
    func setupCollectionView(){
        collectionView?.dataSource = self
        collectionView?.delegate = self
        collectionView?.register(CategoryCVC.self, forCellWithReuseIdentifier: CategoryCVC.identifier)
    }
}

//MARK: UICollectionViewDataSource
extension CategoryVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCVC.identifier, for: indexPath) as! CategoryCVC? else { return UICollectionViewCell() }
        cell.updateCell(
            name       : categories[indexPath.item].nameCategory ?? "Unnamed category",
            color      : categories[indexPath.item].colorCategory ?? "#AAAAAA",
            isFavourity: categories[indexPath.item].isFavourity,
            false, false
        )
        return cell
    }
}

//MARK: UICollectionViewDelegate
extension CategoryVC: UICollectionViewDelegate {
    
    //MARK: contextMenuConfigurationForItemAt
    func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        
        let actionProvider: UIContextMenuActionProvider = { suggestedActions in
            
            let delete = UIAction(title: SetLanguage.setLanguage(.deleteCategory), handler: { [self] action in
                tasks = taskViewModel.fetchTasks()
                categories = categoryViewModel.deleteCategory(index: indexPath.row)
                categoryViewModel.removeTasksOfDeletedCategory(index: indexPath.row)

                collectionView.reloadData()
            })
            delete.image = UIImage(systemName: "trash")
            
            let editNameOfCategory = UIAction(title: SetLanguage.setLanguage(.editCategory)) { [self] action in
                CreateNewCategory.categoryChanged = self
                let vc = CreateNewCategory()
                vc.index = indexPath.row
                switch categories[indexPath.row].colorCategory {
                case UIColor.red.toHex(): vc.colorTag = 0
                case UIColor.orange.toHex(): vc.colorTag = 1
                case UIColor.systemYellow.toHex(): vc.colorTag = 2
                case UIColor.systemGreen.toHex(): vc.colorTag = 3
                case UIColor.systemTeal.toHex(): vc.colorTag = 4
                case UIColor.systemBlue.toHex(): vc.colorTag = 5
                default: vc.colorTag = 6
                 }
                present(vc, animated: true)
            }
            editNameOfCategory.image = UIImage(systemName: "pencil")
            
            return UIMenu(title: "", children: [delete, editNameOfCategory])
        }
        
        return UIContextMenuConfiguration(identifier: nil, previewProvider: nil, actionProvider: actionProvider)
    }
    
    //MARK: didSelectItemAt
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = TasksVC()
        TasksVC.whichCategory = indexPath.item
        TasksVC.titleOfCategory = categories[indexPath.item].nameCategory!
        navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK: UICollectionViewDelegateFlowLayout
extension CategoryVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 100)
    }
}
