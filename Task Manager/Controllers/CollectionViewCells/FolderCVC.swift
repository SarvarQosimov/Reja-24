//
//  FolderCVC.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 15/08/23.
//

import UIKit

class FolderCVC: UICollectionViewCell {
    
    //MARK: Elements
    var folderImg  = UIImageView()
    var folderName = UILabel()
    
    static let identifire: String = String(describing: FolderCVC.self)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    //MARK: updateCell
    func updateCell(_ nameOfFolder: String){
        folderName.text = "\(nameOfFolder) \n"
    }
}
