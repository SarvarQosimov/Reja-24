//
//  ChooseVC+setupViews.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 18/08/23.
//

import Foundation
import UIKit

extension ChooseCategoriesVC {
    func setupViews(){
        view.backgroundColor = Constants.mainBackgroundColor
        
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.scrollDirection = .vertical

        collectionView = UICollectionView(
            frame: view.bounds,
            collectionViewLayout: layout
        )
        
        addSubviews(collectionView, addToFolder, cancelBtn)
        
        collectionView.backgroundColor = .clear
        
        addToFolder.setTitle(SetLanguage.setLanguage(.addToFolder), for: .normal)
        addToFolder.setTitleColor(.systemBlue, for: .normal)
        addToFolder.titleLabel?.font = .italicSystemFont(ofSize: 17)
        addToFolder.addTarget(self, action: #selector(addToFolderPressed(_:)), for: .touchUpInside)
        
        cancelBtn.setTitle(SetLanguage.setLanguage(.cancelBtn), for: .normal)
        cancelBtn.setTitleColor(.systemBlue, for: .normal)
        cancelBtn.titleLabel?.font = .boldSystemFont(ofSize: 17)
        cancelBtn.addTarget(self, action: #selector(cancelPressed(_:)), for: .touchUpInside)
        
        addConstrents()
    }
    
    private func addSubviews(_ views: UIView...){
        views.forEach { element in
            view.addSubview(element)
            element.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func addConstrents(){
        NSLayoutConstraint.activate([
            cancelBtn.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            cancelBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 15),
            
            addToFolder.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            addToFolder.topAnchor.constraint(equalTo: view.topAnchor, constant: 15),
            
            collectionView.topAnchor.constraint(equalTo: addToFolder.bottomAnchor, constant: 30),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -15),
        ])
    }
    
}
