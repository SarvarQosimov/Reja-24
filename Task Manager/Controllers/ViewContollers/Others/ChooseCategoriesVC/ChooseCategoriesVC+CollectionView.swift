//
//  ChooseCategoriesVC+CollectionView.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 18/08/23.
//

import Foundation
import UIKit

extension ChooseCategoriesVC {
    func setupCollectionView(){
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CategoryCVC.self, forCellWithReuseIdentifier: CategoryCVC.identifier)
    }
}

extension ChooseCategoriesVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        options.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCVC.identifier, for: indexPath) as? CategoryCVC else { return UICollectionViewCell() }
        
        if selectedIndexs.contains(indexPath.item) {
            cell.isSelectedCategory = true
        } else {
            cell.isSelectedCategory = false
        }
        
        cell.updateCell(
            name: options[indexPath.item].nameCategory ?? "Unnamed",
            color: options[indexPath.item].colorCategory ?? "#000000",
            isFavourity: options[indexPath.item].isFavourity,
            false, false
        )
        
        return cell
    }
    
}

extension ChooseCategoriesVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if selectedIndexs.contains(indexPath.item) {
            for i in selectedIndexs.enumerated() {
                if i.element == indexPath.item {
                    selectedIndexs.remove(at: i.offset)
                    break
                }
            }
        } else {
            selectedIndexs.append(indexPath.item)
        }
        collectionView.reloadItems(at: [IndexPath(item: indexPath.item, section: 0)])
    }
}

//MARK: UICollectionViewDelegateFlowLayout
extension ChooseCategoriesVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 100)
    }
}
