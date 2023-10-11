//
//  MainVC+TableView.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 13/08/23.
//

import Foundation
import UIKit

extension MainVC {
    func setupTableView(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MainTVC.self, forCellReuseIdentifier: MainTVC.identifire)
        tableView.register(TasksForTodayTVC.self, forCellReuseIdentifier: TasksForTodayTVC.identifire)
    }
}

//MARK: UITableViewDataSource
extension MainVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        if indexPath.row == 0 || indexPath.row == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTVC.identifire, for: indexPath) as? MainTVC else { return UITableViewCell() }
            
            if indexPath.row == 0 {
                cell.typeOfCollection = .category
                cell.setupViews(SetLanguage.setLanguage(.categoriesTitle))
            } else if indexPath.row == 1 {
                cell.typeOfCollection = .folder
                cell.setupViews(SetLanguage.setLanguage(.foldersTitle))
            }
            
            cell.setupItemSize(deviceWidth: view.frame.width)
            cell.selectionStyle = .none
            cell.backgroundColor = Constants.mainBackgroundColor
            
            return cell
        } else {
            guard let cellForTodayTasks = tableView.dequeueReusableCell(withIdentifier: TasksForTodayTVC.identifire, for: indexPath) as? TasksForTodayTVC else { return UITableViewCell() }
            cellForTodayTasks.backgroundColor = Constants.mainBackgroundColor
            
            return cellForTodayTasks
        }
        
    }
}

//MARK: UITableViewDelegate
extension MainVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row ==  0 {
            return (view.frame.width) * 0.5
        } else if indexPath.row == 1 {
            return (view.frame.width) * 0.4
        } else {
            return 300
        }
        
    }
    
}

