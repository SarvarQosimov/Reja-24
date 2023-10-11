//
//  TaskTVC.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 05/07/23.
//

import UIKit

class TaskTVC: UITableViewCell {
        //MARK: Elements
    var backView    = UIView()
    var lbl         = UILabel()
    var finishedBtn = UIButton()
    var borderView  = UIView()
    var addedImg    = UIImageView()
    var dedlineLbl  = UILabel()
    let flagImg     = UIImageView()
    let stack       = UIStackView()
    
    //MARK: Variables
    static let identifire: String = String(describing: TaskTVC.self)
    let viewModel           = TasksViewModel()
    var selectedDate        = ""
    var isDone              = false
    var indexForToday       = 0
    var indexForMain        = 0
    var indexForSchedualed  = 0
    var indexForSearched    = 0
    var indexForFlagged     = 0
    var role: typeOfTaskTVC = .main
    static var finishDelegate: FinishedDelegate!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: TaskTVC.identifire)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    //MARK: donePressed
    @objc func donePressed(_ sender: Any){
        if TasksForTodayTVC.role == .main {
            TaskTVC.finishDelegate.isDone(indexForMain)
        } else if TasksForTodayTVC.role == .today {
            TaskTVC.finishDelegate.isDone(indexForToday)
        } else if TasksForTodayTVC.role == .schedualed {
            TaskTVC.finishDelegate.isDone(indexForSchedualed)
        } else if TasksForTodayTVC.role == .searched {
            TaskTVC.finishDelegate.isDone(indexForSearched)
        } else if TasksForTodayTVC.role == .flagged {
            TaskTVC.finishDelegate.isDone(indexForFlagged)
        }
    }
    
    //MARK: updateCell
    func updateCell(task: String, isDone: Bool, priority: String, dedline: String, img: String, isFlagged: Bool) {
        self.isDone = isDone
        backView.backgroundColor = Constants.mainBackgroundColor
        backView.layer.borderWidth = 3
        
        if let imgNoNil = img.toImage() {
            addedImg.image = imgNoNil
            addedImg.isHidden = false
        } else {
            addedImg.isHidden = true
        }
        
        lbl.textAlignment = .left
        lbl.font = .italicSystemFont(ofSize: 17)
        
        finishedBtn.isHidden = false
        
        if isDone {
            finishedBtn.setImage(UIImage(systemName: "checkmark"), for: .normal)
            lbl.textColor = #colorLiteral(red: 0.7540688515, green: 0.7540867925, blue: 0.7540771365, alpha: 1)
        } else {
            finishedBtn.setImage(UIImage(systemName: "circle"), for: .normal)
            lbl.textColor = Constants.textColor
        }
        
        flagImg.isHidden = !isFlagged
        
        lbl.text = task
        selectedDate = dedline
        dedlineLbl.text = String(selectedDate.dropLast(5))
        
        if priority == "High" {
            borderView.backgroundColor = .red
        } else if priority == "Medium" {
            borderView.backgroundColor = .systemYellow
        } else if priority == "Low" {
            borderView.backgroundColor = .systemGreen
        } else {
            borderView.backgroundColor = .clear
        }
        
    }
    
}


