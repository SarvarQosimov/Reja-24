//
//  CategoryCell.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 02/07/23.
//

import UIKit

class CategoryCVC: UICollectionViewCell { 
    
    //MARK: Elements
    var categoryNameLbl     = UILabel()
    var selectedCategoryImg = UIImageView()
    var favourityBtn        = UIButton()
    
    static let identifier: String = String(describing: CategoryCVC.self)
    ///Is user selecting categories to add specific folder
    var isSelectedCategory = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    //MARK: updateCell
    func updateCell(name: String, color: String, isFavourity: Bool, _ isSelectedCategoryInFolder: Bool, _ isRemoving: Bool){
        let backColor = UIColor(hex: color)
        contentView.backgroundColor =  backColor?.withAlphaComponent(0.25)
        if isSelectedCategory {
            contentView.layer.borderColor = Constants.textColor.cgColor
            contentView.layer.borderWidth = 7
        } else {
            contentView.layer.borderColor = UIColor.init(hex: color)?.cgColor
            contentView.layer.borderWidth = 5
        }
        
        // category is selected to remove from folder
        if isRemoving {
            selectedCategoryImg.isHidden = false
            
            if isSelectedCategoryInFolder {
                selectedCategoryImg.image = UIImage(systemName: "checkmark")
            } else {
                selectedCategoryImg.image = UIImage(systemName: "circle")
            }
            
        } else {
            selectedCategoryImg.isHidden = true
            selectedCategoryImg.image = UIImage(systemName: "circle")
        }

        if isFavourity {
            favourityBtn.isHidden = false
        } else {
            favourityBtn.isHidden = true
        }
        
        categoryNameLbl.text = name
    }
}
