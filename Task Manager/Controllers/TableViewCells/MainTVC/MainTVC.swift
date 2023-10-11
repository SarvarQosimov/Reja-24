//
//  FolderTVC.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 13/08/23.
//

import UIKit
import CoreData

class MainTVC: UITableViewCell {
    
    //MARK: Elements
    var collectionView: UICollectionView!
    var layout         = UICollectionViewFlowLayout()
    var addNewCategory = UIButton()
    var viewAllBtn     = UIButton()
    var headerName     = UILabel()
    let noDataLbl      = UILabel()
    
    //MARK: Variables
    static let identifire: String = String(describing: MainTVC.self)
    let contex = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var categories = [CategoryDB]() {
        didSet {
            if categories.count == 0 && typeOfCollection == .category {
                checkIsEmpty!(.category)
            } else {
                noDataLbl.isHidden = true
            }
        }
    }
    var folders = [FolderDB]() {
        didSet {
            if folders.count == 0 && typeOfCollection == .folder {
                checkIsEmpty!(.folder)
            } else {
                noDataLbl.isHidden = true
            }
        }
    }
    var viewModel         = CategoryViewModel()
    var typeOfCollection  : typeOfCollection = .category
    var categoryViewModel = CategoryViewModel()
    var folderViewModel   = FolderViewModel()
    var checkIsEmpty      : ((typeOfCollection) -> Void)?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        categoryViewModel.updateCategories = self
        
        AllFoldersVC.folderChanged = self
        categories = categoryViewModel.fetchCategories()
        folders = folderViewModel.fetchFolders()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    //MARK: plusPressed
    @objc func plusPressed(_ sender: Any){
        if typeOfCollection == .category {
            CreateNewCategory.categoryChanged = self
            openVcDelegate.openCreateNewCategoryVC()
        } else {
            MainVC.folderChanged = self
            openVcDelegate.openCreateNewFolderVC()
        }
    }
        
    //MARK: seeAllCategories
    @objc func seeAllCategories(_ sender: Any){
        if typeOfCollection == .category {
            CategoryVC.categoryChanged = self
            openVcDelegate.openAllCategoriesVC()
        } else {
            openVcDelegate.openAllFoldersVC()
        }
    }
    
    //MARK: setupItemSize
    func setupItemSize(deviceWidth: CGFloat){
        if typeOfCollection == .category {
            layout.itemSize = CGSize(
                width: deviceWidth * 0.75,
                height: deviceWidth * 0.4
            )
        } else if typeOfCollection == .folder {
            layout.itemSize = CGSize(
                width: deviceWidth * 0.33,
                height: deviceWidth * 0.3
            )
        }

    }
}

