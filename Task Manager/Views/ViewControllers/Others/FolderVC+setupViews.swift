//
//  FolderVC+setupViews.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 18/08/23.
//

import Foundation
import UIKit

extension FolderVC {
    func setupViews(){
        view.backgroundColor = Constants.mainBackgroundColor
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.scrollDirection = .vertical
        
        removeCategoryFromFolderBtn = UIBarButtonItem(image: UIImage(systemName: "minus.circle"), style: .done, target: self, action: #selector(removeCategoryFromFolderPressed(_:)))
        removeCategoryFromFolderBtn.tintColor = .red
        navigationItem.rightBarButtonItem = removeCategoryFromFolderBtn
        
        if categoriesInFolder.count == 0 {
            removeCategoryFromFolderBtn.isHidden = true
        } else {
            removeCategoryFromFolderBtn.isHidden = false
        }
        
        customBackBtn = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .done, target: self, action: #selector(backBtnPressed(_:)))
        customBackBtn.tintColor = .darkGray
        
        cancleBtn = UIBarButtonItem(title: SetLanguage.setLanguage(.cancelBtn), style: .done, target: self, action: #selector(cancelPressed(_:)))
        cancleBtn.tintColor = .systemBlue
        cancleBtn.isHidden = true
        
        navigationItem.leftBarButtonItems = [customBackBtn, cancleBtn]
        
        collectionView = UICollectionView(
            frame: view.bounds,
            collectionViewLayout: layout
        )
        addSubviews()
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        
        addBtn.translatesAutoresizingMaskIntoConstraints = false
        addBtn.setTitle(SetLanguage.setLanguage(.addCategoriesBtn), for: .normal)
        addBtn.setTitleColor(.white, for: .normal)
        addBtn.backgroundColor = #colorLiteral(red: 0.08657697588, green: 0.05708135664, blue: 0.814679265, alpha: 1)
        addBtn.layer.cornerRadius = 5
        addBtn.clipsToBounds = true
        addBtn.addTarget(self, action: #selector(addBtnPressed(_:)), for: .touchUpInside)
        
        addConstrents()
    }
    
    private func addSubviews(){
        view.addSubview(collectionView)
        view.addSubview(addBtn)
    }
    
    private func addConstrents(){
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 33),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 50),
            
            addBtn.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            addBtn.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            addBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -21),
            addBtn.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
    
}
