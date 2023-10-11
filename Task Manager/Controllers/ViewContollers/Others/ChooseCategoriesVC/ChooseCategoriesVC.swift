//
//  ChooseCategoriesVC.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 18/08/23.
//

import UIKit
import CoreData

class ChooseCategoriesVC: UIViewController {
    
    //MARK: Elements
    var collectionView : UICollectionView!
    var layout         = UICollectionViewFlowLayout()
    var selectedIndexs = [Int]()
    var addToFolder    = UIButton()
    var cancelBtn      = UIButton()
    
    //MARK: Variables
    var categoriesInFolder = [CategoryDB]()
    var viewModel          = CategoryViewModel()
    var newID              = ""
    var options            = [CategoryDB]()
    var delegate           : CategoriesInFolderDelegate!
    
    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupCollectionView()
    }
    //MARK: addToFolderPressed
    @objc func addToFolderPressed(_ sender: Any){
        for i in selectedIndexs {
            newID = ""
            newID.append(options[i].id!)
            newID.append("\(FolderVC.whichFolder!)")
            options[i].id = newID
        }
        viewModel.save()
        
        delegate.getCategories(selectedIndexs)
        dismiss(animated: true)
    }
    
    //MARK: cancelPressed
    @objc func cancelPressed(_ sender: Any){
        dismiss(animated: true)
    }
    
}
