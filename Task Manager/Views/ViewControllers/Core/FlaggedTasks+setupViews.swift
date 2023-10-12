//
//  FlaggedTasks+setupViews.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 02/09/23.
//

import Foundation
import UIKit

extension FlaggedTasks {
    //MARK: setupView
    func setupView(){
        
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor : Constants.textColor
        ]
        
        navigationController?.navigationBar.backgroundColor = Constants.mainBackgroundColor
        navigationController?.navigationBar.tintColor = .systemBlue
        
        view.backgroundColor = Constants.mainBackgroundColor
        title = SetLanguage.setLanguage(.flaggedTitle)
        navigationItem.backButtonTitle = SetLanguage.setLanguage(.task)
        
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        
        getFlaggedTasks()
        
        noTasksLbl.translatesAutoresizingMaskIntoConstraints = false
        noTasksLbl.text = SetLanguage.setLanguage(.noFlaggedTasksMessage)
        noTasksLbl.font = UIFont(name: "Noteworthy Bold", size: 23)
        noTasksLbl.textColor = #colorLiteral(red: 0.2470588237, green: 0.3882353008, blue: 0.5450980663, alpha: 1)
        noTasksLbl.numberOfLines = 0
        
        addSubviews()
        addConstraints()
        
        if UserDefaults.standard.string(forKey: Constants.appLanguage) == "ru" {
            NSLayoutConstraint.activate([
                noTasksLbl.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25),
                noTasksLbl.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
                noTasksLbl.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
        } else {
            NSLayoutConstraint.activate([
                noTasksLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                noTasksLbl.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
        }
    }
    
    private func addSubviews() {
        view.addSubview(tableView)
        view.addSubview(noTasksLbl)
    }

    private func addConstraints() {
        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5),
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 5),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -5),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -5)
        ])
    }
    
}
