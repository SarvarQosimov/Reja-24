//
//  FolderCVC+setupViews.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 05/10/23.
//

import Foundation
import UIKit

extension FolderCVC {
    //MARK: setupViews
    func setupViews(){
        contentView.backgroundColor = .clear
        
        addSubviews()
        
        /*      folderName      */
        folderName.translatesAutoresizingMaskIntoConstraints = false
        folderName.font = UIFont(name: "Noteworthy Bold", size: 15)
        folderName.numberOfLines = 2
        folderName.textColor = .systemBrown
        folderName.textAlignment = .center
        folderName.lineBreakMode = .byCharWrapping
        
        /*       folderImg     */
        folderImg.translatesAutoresizingMaskIntoConstraints = false
        folderImg.image = UIImage(named: "folder")

        addConstraints()
    }
    
    //MARK: addSubviews
    private func addSubviews(){
        contentView.addSubview(folderName)
        contentView.addSubview(folderImg)
    }
    
    //MARK: addConstraints
    private func addConstraints(){
        NSLayoutConstraint.activate([
            folderName.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 3),
            folderName.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -3),
            folderName.topAnchor.constraint(equalTo:contentView.topAnchor, constant: 0),
            folderName.heightAnchor.constraint(equalToConstant: 50),
            folderName.widthAnchor.constraint(equalToConstant: 250),
            
            folderImg.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0),
            folderImg.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0),
            folderImg.topAnchor.constraint(equalTo: folderName.bottomAnchor, constant: 5),
            folderImg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0)
        ])
    }

}
