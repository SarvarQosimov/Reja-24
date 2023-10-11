//
//  TaskVC+setupViews.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 06/10/23.
//

import Foundation
import UIKit

extension TasksVC {
    //MARK: setupViews
    func setupViews(){
        title = TasksVC.titleOfCategory
        navigationItem.backButtonTitle = SetLanguage.setLanguage(.task)
        view.backgroundColor = Constants.mainBackgroundColor
        
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        
        segment.translatesAutoresizingMaskIntoConstraints = false
        segment.backgroundColor = .lightGray
        segment.insertSegment(withTitle: SetLanguage.setLanguage(.all), at: 0, animated: true)
        segment.insertSegment(withTitle: SetLanguage.setLanguage(.toDo), at: 1, animated: true)
        segment.insertSegment(withTitle: SetLanguage.setLanguage(.done), at: 2, animated: true)
        segment.selectedSegmentIndex = 0
        segment.addTarget(self, action: #selector(segmentAction(_:)), for: .valueChanged)
        
        
        addBtn.translatesAutoresizingMaskIntoConstraints = false
        addBtn.backgroundColor = #colorLiteral(red: 0.1960784314, green: 0.8431372549, blue: 0.2941176471, alpha: 1)
        addBtn.setTitle(SetLanguage.setLanguage(.addNewTask), for: .normal)
        addBtn.titleLabel?.font = UIFont(name: "American Typewriter Condensed Bold", size: 21)
        addBtn.setTitleColor(.white, for: .normal)
        addBtn.layer.cornerRadius = 5
        addBtn.addTarget(self, action: #selector(addTaskPressed(_:)), for: .touchUpInside)
        
        let height = view.frame.height
            
        addSubviews(tableView, segment, addBtn)
        addConstraints(height)
    }
    
    private func addSubviews(_ views: UIView...){
        views.forEach { element in
            view.addSubview(element)
        }
    }
    
    private func addConstraints(_ height: CGFloat){
        NSLayoutConstraint.activate([
            segment.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            segment.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            segment.topAnchor.constraint(equalTo: view.topAnchor, constant: height * 0.13),
            segment.heightAnchor.constraint(equalToConstant: 40),
            
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5),
            tableView.topAnchor.constraint(equalTo: segment.bottomAnchor, constant: 15),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -5),
            tableView.bottomAnchor.constraint(equalTo: addBtn.topAnchor, constant: -5),
            
            addBtn.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            addBtn.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            addBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -25),
            addBtn.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
    
}
