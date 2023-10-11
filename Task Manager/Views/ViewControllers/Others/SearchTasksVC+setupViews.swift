//
//  SearchTasksVC+setupViews.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 06/10/23.
//

import Foundation
import UIKit

extension SearchTasksVC {
    //MARK: setupViews
    func setupViews(){
        title = SetLanguage.setLanguage(.searchTaskTitle)
        navigationItem.backButtonTitle = SetLanguage.setLanguage(.searchTaskTitle)
        
        view.backgroundColor = Constants.mainBackgroundColor
        
        searchTF.translatesAutoresizingMaskIntoConstraints = false
        searchTF.backgroundColor = Constants.mainBackgroundColor
        searchTF.textColor = Constants.textColor
        searchTF.layer.cornerRadius = 15
        searchTF.layer.borderWidth = 2
        searchTF.layer.borderColor = Constants.textColor.cgColor
        searchTF.delegate = self
        
        let atributes: [NSAttributedString.Key : Any] = [
            .foregroundColor : UIColor.lightGray
        ]
        
        let attributedPlaceholder = NSAttributedString(string: "        \(SetLanguage.setLanguage(.searchYourTaskPlaceholder))", attributes: atributes)
        
        searchTF.attributedPlaceholder = attributedPlaceholder
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneBtn = UIBarButtonItem(title: SetLanguage.setLanguage(.done), image: nil, target: self, action: #selector(donePressed(_:)))
        toolBar.items = [UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil), doneBtn]
        searchTF.inputAccessoryView = toolBar
        
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
                
        let height = view.frame.height
        
        addSubviews()
        addConstraints(height)
    }

    private func addSubviews(){
        view.addSubview(searchTF)
        view.addSubview(tableView)
    }
    
    private func addConstraints(_ height: CGFloat){
        NSLayoutConstraint.activate([
        searchTF.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5),
        searchTF.topAnchor.constraint(equalTo: view.topAnchor, constant: 0.11 * height),
        searchTF.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
        searchTF.heightAnchor.constraint(equalToConstant: 50),
        
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
        tableView.topAnchor.constraint(equalTo: searchTF.bottomAnchor, constant: 15),
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
    
}
