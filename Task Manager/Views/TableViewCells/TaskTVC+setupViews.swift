//
//  TaskVC+setupViews.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 17/08/23.
//

import Foundation
import UIKit

extension TaskTVC {
    //MARK: setupViews
    func setupViews(){
        contentView.backgroundColor = .clear
        addSubviews()
        addConstraints()
        
        backView.backgroundColor = Constants.mainBackgroundColor
        backView.layer.borderColor = #colorLiteral(red: 0.2470588237, green: 0.3882353008, blue: 0.5450980663, alpha: 1)
        
        backView.layer.borderWidth = 3
        backView.layer.cornerRadius = 11
        
        backView.translatesAutoresizingMaskIntoConstraints = false
        
        borderView.translatesAutoresizingMaskIntoConstraints = false
        borderView.backgroundColor = .red
        borderView.layer.cornerRadius = 11
        borderView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        
        flagImg.translatesAutoresizingMaskIntoConstraints = false
        flagImg.image = UIImage(systemName: "flag.fill")
        flagImg.tintColor = .orange
        
        addedImg.translatesAutoresizingMaskIntoConstraints = false
        addedImg.layer.cornerRadius = 5
        addedImg.clipsToBounds = true
        
        let miniLbl = UILabel()
        miniLbl.translatesAutoresizingMaskIntoConstraints = false
        miniLbl.heightAnchor.constraint(equalToConstant: 30).isActive = true
        miniLbl.widthAnchor.constraint(equalToConstant: 1).isActive = true
        
        stack.addArrangedSubview(miniLbl)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.addArrangedSubview(flagImg)
        stack.addArrangedSubview(addedImg)
        stack.axis = .horizontal
        stack.spacing = 5
        
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        lbl.font = UIFont(name: "StickySugary-Regular", size: 17)
        lbl.textAlignment = .left
        lbl.textColor = Constants.textColor
        
        dedlineLbl.translatesAutoresizingMaskIntoConstraints = false
        dedlineLbl.textColor = .lightGray
        dedlineLbl.font = .italicSystemFont(ofSize: 11)
        dedlineLbl.numberOfLines = 1

        finishedBtn.translatesAutoresizingMaskIntoConstraints = false
        finishedBtn.setImage(UIImage(systemName: "circle"), for: .normal)
        finishedBtn.setPreferredSymbolConfiguration(.init(weight: .bold), forImageIn: .normal)
        finishedBtn.addTarget(self, action: #selector(donePressed(_:)), for: .touchUpInside)
    }
    //MARK: addSubviews
   private func addSubviews(){
       contentView.addSubview(backView)
       backView.addSubview(borderView)
       backView.addSubview(stack)
       backView.addSubview(lbl)
       backView.addSubview(dedlineLbl)
       backView.addSubview(finishedBtn)
    }
    
    //MARK: addConstraints
   private func addConstraints(){
        NSLayoutConstraint.activate([
            backView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0),
            backView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            backView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0),
            backView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            
            borderView.topAnchor.constraint(equalTo: backView.topAnchor, constant: 5),
            borderView.leftAnchor.constraint(equalTo: backView.leftAnchor, constant: 3),
            borderView.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -5),
            borderView.widthAnchor.constraint(equalToConstant: 15),
            
            stack.leftAnchor.constraint(equalTo: borderView.rightAnchor, constant: 3),
            stack.centerYAnchor.constraint(equalTo: borderView.centerYAnchor),
            
            lbl.topAnchor.constraint(equalTo: backView.topAnchor, constant: 5),
            lbl.leftAnchor.constraint(equalTo: stack.rightAnchor, constant: 5),
            lbl.rightAnchor.constraint(equalTo: backView.rightAnchor, constant: -50),
            lbl.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -25),
            
            dedlineLbl.rightAnchor.constraint(equalTo: backView.rightAnchor, constant: -35),
            dedlineLbl.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -5),
            
            flagImg.heightAnchor.constraint(equalToConstant: 30),
            flagImg.widthAnchor.constraint(equalToConstant: 30),
            
            addedImg.heightAnchor.constraint(equalToConstant: 30),
            addedImg.widthAnchor.constraint(equalToConstant: 30),
            
            finishedBtn.centerYAnchor.constraint(equalTo: backView.centerYAnchor),
            finishedBtn.rightAnchor.constraint(equalTo: backView.rightAnchor, constant: -10),
            finishedBtn.heightAnchor.constraint(equalToConstant: 30),
            finishedBtn.widthAnchor.constraint(equalToConstant: 30)
        ])
    }
}
