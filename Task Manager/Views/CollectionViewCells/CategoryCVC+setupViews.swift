//
//  CategoryCVC+setupViews.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 07/10/23.
//

import Foundation
import UIKit

extension CategoryCVC {
    //MARK: setupViews
    func setupViews(){
        contentView.layer.cornerRadius = 25
        contentView.clipsToBounds = true
        
        addSubviews()
        
        categoryNameLbl.textColor = .brown
        categoryNameLbl.font = UIFont(name: "Noteworthy Bold", size: 19)
        categoryNameLbl.numberOfLines = 0
        categoryNameLbl.textAlignment = .center
        categoryNameLbl.translatesAutoresizingMaskIntoConstraints = false
        categoryNameLbl.lineBreakMode = .byCharWrapping

        
        favourityBtn.translatesAutoresizingMaskIntoConstraints = false
        favourityBtn.setImage(UIImage(systemName: "bookmark.fill"), for: .normal)
        favourityBtn.tintColor = .blue
        
        selectedCategoryImg.translatesAutoresizingMaskIntoConstraints = false
        selectedCategoryImg.image = UIImage(systemName: "circle")
        selectedCategoryImg.isHidden = true
        
        addConstraints()
        
    }

    private func addSubviews() {
        contentView.addSubview(categoryNameLbl)
        contentView.addSubview(favourityBtn)
        contentView.addSubview(selectedCategoryImg)
    }
    
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            categoryNameLbl.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5),
            categoryNameLbl.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
            categoryNameLbl.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            categoryNameLbl.bottomAnchor.constraint(equalTo: favourityBtn.topAnchor, constant: -3),
            
            favourityBtn.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5),
            favourityBtn.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            favourityBtn.heightAnchor.constraint(equalToConstant: 33),
            favourityBtn.widthAnchor.constraint(equalToConstant: 33),
            
            selectedCategoryImg.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15),
            selectedCategoryImg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15)
        ])
    }
    
}
