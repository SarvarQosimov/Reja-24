//
//  TasksForTodayTVC+setupViews.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 06/10/23.
//

import Foundation
import UIKit

extension TasksForTodayTVC {
    //MARK: setupViews
    func setupViews(){
        tableView = UITableView(frame: contentView.bounds, style: .plain)

        addSubviews()
        
        contentView.backgroundColor = Constants.mainBackgroundColor
        
        openCloseBtn.translatesAutoresizingMaskIntoConstraints = false
        openCloseBtn.setTitle("\(SetLanguage.setLanguage(.tasksForToday)) ⌄", for: .normal)
        openCloseBtn.titleLabel?.font = UIFont(name: "Gill Sans Bold Italic", size: 21)
        openCloseBtn.setTitleColor(.systemBlue, for: .normal)
        openCloseBtn.addTarget(self, action: #selector(openCloseBtnPressed(_:)), for: .touchUpInside)
       
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        
        addConstraints()
    }

    private func addSubviews(){
        contentView.addSubview(openCloseBtn)
        contentView.addSubview(tableView)
    }
    
    private func addConstraints(){
        NSLayoutConstraint.activate([
            openCloseBtn.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            openCloseBtn.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 3),
            openCloseBtn.heightAnchor.constraint(equalToConstant: 30),
            
            tableView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
            tableView.topAnchor.constraint(equalTo: openCloseBtn.bottomAnchor, constant: 15),
            tableView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5),
            tableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
        ])
    }

    
}
