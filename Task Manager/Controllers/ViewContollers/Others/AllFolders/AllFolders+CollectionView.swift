//
//  AllFolders+CollectionView.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 24/08/23.
//

import Foundation
import UIKit

extension AllFoldersVC {
    func setupCollectionView(){
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(FolderCVC.self, forCellWithReuseIdentifier: FolderCVC.identifire)
    }
}

//MARK: UICollectionViewDataSource
extension AllFoldersVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        folders.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FolderCVC.identifire, for: indexPath) as? FolderCVC else { return UICollectionViewCell() }
        cell.updateCell(folders[indexPath.item].name ?? "unnamed")
        
        return cell
        
    }
}

//MARK: UICollectionViewDelegate
extension AllFoldersVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = FolderVC()
        vc.title = folders[indexPath.item].name ?? "unnamed"
        FolderVC.whichFolder = indexPath.item
        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    //MARK: contextMenuConfigurationForItemAt
    func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        
        let actionProvider: UIContextMenuActionProvider = { suggestedActions in
            let delete = UIAction(title: SetLanguage.setLanguage(.deleteFolder), handler: { [self] action in
                
                folders = folderViewModel.deleteFolder(index: indexPath.item)
                changeID(indexPath.item)
                collectionView.reloadData()
            })
            delete.image = UIImage(systemName: "trash")
            
            let edit = UIAction(title: SetLanguage.setLanguage(.editFolder), handler: { [self] action in
                editFolder(folders[indexPath.item].name ?? "unnamed", index: indexPath.item)
            })
            edit.image = UIImage(systemName: "pencil")
            
            return UIMenu(title: "", children: [edit, delete ])
        }
        
        return UIContextMenuConfiguration(identifier: nil, previewProvider: nil, actionProvider: actionProvider)
    }
}

//MARK: UICollectionViewDelegateFlowLayout
extension AllFoldersVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 115)
    }
}

