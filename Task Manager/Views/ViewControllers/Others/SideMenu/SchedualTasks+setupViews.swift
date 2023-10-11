//
//  SchedualTasks+setupViews.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 07/10/23.
//

import Foundation
import UIKit

extension ScheduledTasksVC {
    //MARK: setupViews
    func setupViews(){
        tableView = UITableView(frame: view.frame, style: .plain)

        addSubviews()
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        
        title = SetLanguage.setLanguage(.scheduledTasksTitle)
        view.backgroundColor = Constants.mainBackgroundColor
        TasksForTodayTVC.role = .schedualed

        noTasksLbl.translatesAutoresizingMaskIntoConstraints = false
        noTasksLbl.text = SetLanguage.setLanguage(.noScheduledTasksMessanger)
        noTasksLbl.font = UIFont(name: "Noteworthy Bold", size: 23)
        noTasksLbl.textColor = #colorLiteral(red: 0.2470588237, green: 0.3882353008, blue: 0.5450980663, alpha: 1)
        noTasksLbl.numberOfLines = 0
        
        addConstraints()
    }

    private func addSubviews(){
        view.addSubview(tableView)
        view.addSubview(noTasksLbl)
    }
    
    private func addConstraints(){
        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 25),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -15),
            
            noTasksLbl.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25),
            noTasksLbl.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            noTasksLbl.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    
}
