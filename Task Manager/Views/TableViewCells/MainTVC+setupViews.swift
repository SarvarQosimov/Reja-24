//
//  MainTVC+setupViews.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 21/08/23.
//

import Foundation
import UIKit

extension MainTVC {
    //MARK: setupViews
    func setupViews(_ headerTaxt: String){
        layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        layout.scrollDirection = .horizontal

        collectionView = UICollectionView(
            frame: contentView.bounds,
            collectionViewLayout: layout
        )
        
        addSubviews()
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CategoryCVC.self, forCellWithReuseIdentifier: CategoryCVC.identifier)
        collectionView.register(FolderCVC.self, forCellWithReuseIdentifier: FolderCVC.identifire)
        
        addNewCategory.translatesAutoresizingMaskIntoConstraints = false
        addNewCategory.layer.cornerRadius = 12
        addNewCategory.clipsToBounds = true
        addNewCategory.setImage(UIImage(systemName: "plus.circle.fill"), for: .normal)
        addNewCategory.tintColor = .systemGreen
        addNewCategory.addTarget(self, action: #selector(plusPressed(_:)), for: .touchUpInside)
        
        headerName.translatesAutoresizingMaskIntoConstraints = false
        headerName.font = UIFont(name: "Psychedelic-Regular", size: 21)
        headerName.text = headerTaxt
        headerName.textColor = Constants.textColor
        
        viewAllBtn.translatesAutoresizingMaskIntoConstraints = false
        viewAllBtn.setTitle(SetLanguage.setLanguage(.allBtn), for: .normal)
        viewAllBtn.titleLabel?.font = .boldSystemFont(ofSize: 17)
        viewAllBtn.setTitleColor(.systemBlue, for: .normal)
        viewAllBtn.addTarget(self, action: #selector(seeAllCategories(_:)), for: .touchUpInside)
        
        collectionView.addSubview(noDataLbl)
        noDataLbl.translatesAutoresizingMaskIntoConstraints = false
        noDataLbl.font = UIFont(name: "American Typewriter Bold", size: 17)
        noDataLbl.textColor = #colorLiteral(red: 0.03000372276, green: 0.7603657842, blue: 0.6727795005, alpha: 1)
        noDataLbl.isHidden = true
        noDataLbl.numberOfLines = 0
        
        checkIsEmpty = { [self] type in
            noDataLbl.isHidden = false
            switch type {
            case .category: noDataLbl.text = SetLanguage.setLanguage(.pressPlusForCategoriesMessage)
            case .folder: noDataLbl.text = SetLanguage.setLanguage(.pressPlusForFoldersMessage)
            }
        }
        
        if categories.count == 0 && typeOfCollection == .category{
            checkIsEmpty!(.category)
        } else if folders.count == 0 && typeOfCollection == .folder {
            checkIsEmpty!(.folder)
        }
                
        addConstraints()
        collectionView.reloadData()
    }

    private func addSubviews(){
        contentView.addSubview(headerName)
        contentView.addSubview(viewAllBtn)
        contentView.addSubview(collectionView)
        contentView.addSubview(addNewCategory)
    }
    
    private func addConstraints(){
        NSLayoutConstraint.activate([
            collectionView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
            collectionView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -33),
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 25),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            
            addNewCategory.widthAnchor.constraint(equalToConstant: 45),
            addNewCategory.heightAnchor.constraint(equalToConstant: 45),
            addNewCategory.leftAnchor.constraint(equalTo: collectionView.rightAnchor, constant: 1),
            addNewCategory.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            headerName.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
            headerName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
                        
            viewAllBtn.rightAnchor.constraint(equalTo: collectionView.rightAnchor, constant: 0),
            viewAllBtn.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            
            noDataLbl.leftAnchor.constraint(equalTo: collectionView.leftAnchor, constant: 5),
            noDataLbl.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -33),
            noDataLbl.centerYAnchor.constraint(equalTo: collectionView.centerYAnchor)
        ])
    }
    
}
