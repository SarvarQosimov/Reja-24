//
//  FolderVC.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 18/08/23.
//

import UIKit
import CoreData

class FolderVC: UIViewController {

    //MARK: Elements
    var collectionView: UICollectionView!
    var layout = UICollectionViewFlowLayout()
    var addBtn = UIButton()
    var customBackBtn = UIBarButtonItem()
    var cancleBtn = UIBarButtonItem()
    var removeCategoryFromFolderBtn = UIBarButtonItem()
    
    //MARK: Variables
    static var whichFolder       : Int!
    var viewModel                = CategoryViewModel()
    var categories               = [CategoryDB]()
    var selectedIndexs           = [Int]()
    var isRemoving               = false
    var removingCategoriesIndexs = [Int]()
    var categoriesInFolder       = [CategoryDB]() {
        didSet {
            if categoriesInFolder.count == 0 {
                removeCategoryFromFolderBtn.isHidden = true
            } else {
                removeCategoryFromFolderBtn.isHidden = false
            }
        }
    }
    
    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        categories = viewModel.fetchCategories()
        sortByFolder()
        setupTableView()
    }
    
    //MARK: removeCategoryFromFolderPressed
    @objc func removeCategoryFromFolderPressed(_ sender: Any){
        if !isRemoving {
            removeCategoryFromFolderBtn.image = nil
            removeCategoryFromFolderBtn.title = SetLanguage.setLanguage(.delete)
            customBackBtn.isHidden = true
            cancleBtn.isHidden = false
            isRemoving = true
            collectionView.reloadData()
        } else {
            if removingCategoriesIndexs.count != 0 {
                alertToDeleteCategories()
            }
        }
    }
  
    //MARK: backBtnPressed
    @objc func backBtnPressed(_ sender: Any){
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: cancelPressed
    @objc func cancelPressed(_ sender: Any){
        isRemoving = false
        cancleBtn.isHidden = true
        customBackBtn.isHidden = false
        removeCategoryFromFolderBtn.title = ""
        removeCategoryFromFolderBtn.image = UIImage(systemName: "minus.circle")
        removingCategoriesIndexs.removeAll()
        collectionView.reloadData()
    }
    
    //MARK: addBtnPressed
    @objc func addBtnPressed(_ sender: Any){
        let vc = ChooseCategoriesVC()
        var userOptions = [CategoryDB]()
        for i in categories.enumerated() {
            if !selectedIndexs.contains(i.offset) {
                userOptions.append(i.element)
            }
        }
        vc.options = userOptions
        vc.delegate = self
        present(vc, animated: true)
    }
    
    //MARK: sortByFolder
    func sortByFolder(){
        categoriesInFolder = []
        selectedIndexs = []
        for i in categories.enumerated() {
            for _id in i.element.id! {
                if "\(_id)" == "\(FolderVC.whichFolder!)" {
                    categoriesInFolder.append(i.element)
                    selectedIndexs.append(i.offset)
                    break
                }
            }
        }
        collectionView.reloadData()
    }
    
    //MARK: alertToDeleteCategories
    func alertToDeleteCategories(){
        let alert = UIAlertController(title: nil, message: SetLanguage.setLanguage(.warningMessage), preferredStyle: .alert)
        let action1 = UIAlertAction(title: SetLanguage.setLanguage(.delete), style: .destructive) { [self] deleteAction in
            
            for i in removingCategoriesIndexs {
                categoriesInFolder[i].id = removeFromFolder(categoriesInFolder[i].id!)
            }
            
            sortByFolder()
            
            isRemoving = false
            cancleBtn.isHidden = true
            customBackBtn.isHidden = false
            removingCategoriesIndexs.removeAll()
            removeCategoryFromFolderBtn.title = ""
            removeCategoryFromFolderBtn.image = UIImage(systemName: "minus.circle")
            collectionView.reloadData()
        }
        let action2 = UIAlertAction(title: SetLanguage.setLanguage(.cancelBtn), style: .cancel)
        alert.addAction(action1)
        alert.addAction(action2)
        present(alert, animated: true)
    }
    
    func removeFromFolder(_ id: String) -> String {
        var newID = ""
        for i in id where "\(i)" != "\(FolderVC.whichFolder!)" {
            newID.append(i)
        }
        
        return newID
    }
    
}
