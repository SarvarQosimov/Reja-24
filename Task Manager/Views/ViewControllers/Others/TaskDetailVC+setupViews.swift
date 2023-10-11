//
//  TaskDetailVC+setupViews.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 29/08/23.
//

import Foundation
import UIKit

extension TaskDetailVC {
    func setupViews(){
        view.backgroundColor = Constants.mainBackgroundColor
        
        addSubviews(taskImage, taskLbl, taskName, noteLbl, note, stack, doneLbl, isDone, datePicker)
        
        taskImage.translatesAutoresizingMaskIntoConstraints = false
        taskImage.layer.cornerRadius = 10
        taskImage.clipsToBounds = true

        taskLbl.translatesAutoresizingMaskIntoConstraints = false
        taskLbl.font = UIFont(name: "Palatino-BoldItalic", size: 21)
        taskLbl.text = "\(SetLanguage.setLanguage(.task)):"
        taskLbl.textColor = Constants.textColor
        taskLbl.textAlignment = .center
        
        taskName.translatesAutoresizingMaskIntoConstraints = false
        taskName.font = UIFont(name: "Futura-MediumItalic", size: 21)
        taskName.textColor = Constants.textColor
        taskName.numberOfLines = 0
        taskName.layer.cornerRadius = 10
        taskName.clipsToBounds = true
        taskName.layer.borderWidth = 3
        taskName.textAlignment = .center
        
        stack1.translatesAutoresizingMaskIntoConstraints = false
        stack1.addArrangedSubview(taskLbl)
        stack1.addArrangedSubview(taskName)
        stack1.axis = .vertical
        stack1.spacing = 0
        stack1.distribution = .fillProportionally
        
        noteLbl.translatesAutoresizingMaskIntoConstraints = false
        noteLbl.font = UIFont(name: "Palatino-BoldItalic", size: 19)
        noteLbl.text = "\(SetLanguage.setLanguage(.note)):"
        noteLbl.textColor = Constants.textColor
        noteLbl.textAlignment = .center
        
        note.translatesAutoresizingMaskIntoConstraints = false
        note.font = UIFont(name: "AmericanTypewriter-Condensed", size: 19)
        note.textColor = #colorLiteral(red: 0.4756349325, green: 0.4756467342, blue: 0.4756404161, alpha: 1)
        note.numberOfLines = 0
        
        stack2.translatesAutoresizingMaskIntoConstraints = false
        stack2.addArrangedSubview(noteLbl)
        stack2.addArrangedSubview(note)
        stack2.axis = .vertical
        stack2.spacing = 5
        stack2.distribution = .fillProportionally
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.addArrangedSubview(stack1)
        stack.addArrangedSubview(stack2)
        stack.axis = .vertical
        stack.spacing = 25
        stack.distribution = .fillProportionally
        
        doneLbl.translatesAutoresizingMaskIntoConstraints = false
        doneLbl.text = SetLanguage.setLanguage(.finished)
        doneLbl.textColor = Constants.textColor
        doneLbl.font = UIFont(name: "Psychedelic-Regular", size: 21)
        
        isDone.translatesAutoresizingMaskIntoConstraints = false
        isDone.isEnabled = false
        
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.datePickerMode = .dateAndTime
        datePicker.backgroundColor = .lightText
        datePicker.layer.cornerRadius = 10
        datePicker.clipsToBounds = true
        
        addConstraints()
    }
    
    private func addSubviews(_ views: UIView...){
        views.forEach { element in
            view.addSubview(element)
        }
    }
    
    private func addConstraints(){
        NSLayoutConstraint.activate([
            taskImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            taskImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            taskImage.widthAnchor.constraint(equalToConstant: 150),
            taskImage.heightAnchor.constraint(equalToConstant: 150),
            
            stack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            stack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            stack.topAnchor.constraint(equalTo: taskImage.bottomAnchor, constant: 33),
            stack.bottomAnchor.constraint(equalTo: isDone.topAnchor, constant: -33),
            
            doneLbl.topAnchor.constraint(equalTo: stack.bottomAnchor, constant: 33),
            doneLbl.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 33),
            
            isDone.bottomAnchor.constraint(equalTo: datePicker.topAnchor, constant: 15),
            isDone.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -33),
            
            datePicker.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -25),
            datePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            datePicker.heightAnchor.constraint(equalToConstant: 50),
            datePicker.widthAnchor.constraint(equalToConstant: 200)
        ])
    }

    
}
