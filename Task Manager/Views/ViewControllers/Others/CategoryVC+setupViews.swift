//
//  CategoryVC+setupViews.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 07/10/23.
//

import Foundation
import UIKit

extension CategoryVC {
    //MARK: setupViews
    func setupViews(){
        title = SetLanguage.setLanguage(.categoriesTitle)
        navigationItem.backButtonTitle = SetLanguage.setLanguage(.categoriesTitle)
        view.backgroundColor = Constants.mainBackgroundColor
        navigationController?.navigationBar.backgroundColor = .clear
        
        backgroundImg.translatesAutoresizingMaskIntoConstraints = false
        backgroundImg.image = UIImage(named: "backgroundLight")
        backgroundImg.layer.cornerRadius = 50
        backgroundImg.clipsToBounds = true
        
        let cvLayout = UICollectionViewFlowLayout()
        cvLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        cvLayout.scrollDirection = .vertical
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: cvLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        
        addSubviews()
        addConstraints()
    }
    
    private func addSubviews(){
        view.addSubview(backgroundImg)
        view.addSubview(collectionView)
    }
    
    private func addConstraints(){
        NSLayoutConstraint.activate([
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 5),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -5),

            backgroundImg.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            backgroundImg.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backgroundImg.widthAnchor.constraint(equalToConstant: 200),
            backgroundImg.heightAnchor.constraint(equalToConstant: 200)
        ])
    }

}
