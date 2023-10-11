//
//  AllFolders+setupViews.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 24/08/23.
//

import Foundation
import UIKit

extension AllFoldersVC {
    func setupViews(){
        title = SetLanguage.setLanguage(.foldersTitle)
        navigationItem.backButtonTitle = SetLanguage.setLanguage(.foldersTitle)
        view.backgroundColor = Constants.mainBackgroundColor
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.scrollDirection = .vertical

        collectionView = UICollectionView(
            frame: view.bounds,
            collectionViewLayout: layout
        )
        addSubviews()
        
        backgroundImg.translatesAutoresizingMaskIntoConstraints = false
        backgroundImg.image = UIImage(named: "backgroundLight")
        backgroundImg.layer.cornerRadius = 50
        backgroundImg.clipsToBounds = true
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        
        addConstrents()
    }
    
    private func addSubviews(){
        view.addSubview(backgroundImg)
        view.addSubview(collectionView)
    }
    
    private func addConstrents(){
        NSLayoutConstraint.activate([
            backgroundImg.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backgroundImg.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            backgroundImg.widthAnchor.constraint(equalToConstant: 200),
            backgroundImg.heightAnchor.constraint(equalToConstant: 200),
            
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 25),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 50),
        ])
    }
    
}

