//
//  MainVC+setupViews.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 05/10/23.
//

import Foundation
import UIKit

extension MainVC {
    //MARK: setupViews
    func setupViews(){
        view.backgroundColor = Constants.mainBackgroundColor
        title = SetLanguage.setLanguage(.homeTitle)
        navigationController?.navigationBar.barTintColor = Constants.mainBackgroundColor
        navigationItem.backButtonTitle = SetLanguage.setLanguage(.homeTitle)
        
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor : Constants.textColor
        ]
        
        tableView = UITableView(frame: CGRect(
            x: 0,
            y: 30,
            width: view.frame.width,
            height: view.frame.height-55
        ), style: .plain)
        
        view.addSubview(tableView)
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        
        let menuBtn = UIBarButtonItem(image: UIImage(systemName: "line.horizontal.3"), style: .done, target: self, action: #selector(menuPressed(_:)))
        navigationItem.leftBarButtonItem = menuBtn
        
        let searchBtn = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .done, target: self, action: #selector(searchPressed(_:)))
        navigationItem.rightBarButtonItem = searchBtn
    }

}
