//
//  AllFolders.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 24/08/23.
//

import UIKit

class AllFoldersVC: UIViewController {
    
    //MARK: Elements
    var collectionView: UICollectionView!
    let layout        = UICollectionViewFlowLayout()
    let backgroundImg = UIImageView()
    
    var folders           = [FolderDB]()
    var categories        = [CategoryDB]()
    var folderViewModel   = FolderViewModel()
    var categoryViewModel = CategoryViewModel()
    var shouldChange      = [Int]()
    var newIds            = ""
    
    static var folderChanged: DataChangedDelegate!
    
    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        folders = folderViewModel.fetchFolders()
        setupViews()
        setupCollectionView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        AllFoldersVC.folderChanged.foldersChanged()
    }
    
    func editFolder(_ oldName: String, index: Int) {
        let alertController = UIAlertController(title: SetLanguage.setLanguage(.newFolder), message: nil, preferredStyle: .alert)
        alertController.addTextField { textField in
            textField.placeholder = SetLanguage.setLanguage(.nameOfNewTask)
            textField.text = oldName
        }
        let createAction = UIAlertAction(title: SetLanguage.setLanguage(.createBtn), style: .default) { [self] _ in
            if let textField = alertController.textFields?.first, let text = textField.text {
                folders[index].name = text
                folderViewModel.save()
                collectionView.reloadData()
            }
        }
        let cancelAction = UIAlertAction(title: SetLanguage.setLanguage(.cancelBtn), style: .cancel)
        alertController.addAction(createAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
    
    //MARK: changeID
    func deleteAndDecreaseID(_ index: Int, ids: [Int]) -> String {
        var outPut = [Int]()
        var changedString = ""
        for id in ids {
            if id == index {
                //skip
            } else if id > index {
                outPut.append(id-1)
            } else {
                outPut.append(id)
            }
        }
        for i in outPut {
            changedString.append("\(i)")
        }
        return changedString
    }

    //MARK: deleteAndDecreaseID
    func changeID(_ index: Int){
        categories = categoryViewModel.fetchCategories()
        
        for category in categories.enumerated() {
            if let _id = category.element.id {
                shouldChange = _id.convertToIntArray()
                newIds = deleteAndDecreaseID(index, ids: shouldChange)
                categories[category.offset].id = newIds
            }
        }
        folderViewModel.save()
    }
    
}
