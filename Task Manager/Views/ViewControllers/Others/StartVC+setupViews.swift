//
//  StartVC+setupViews.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 02/09/23.
//

import Foundation
import UIKit

extension StartVC {
    //MARK: setupViews
    func setupViews(){
        addSubviews(img, descreptionLbl, startBtn)
        
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "categoryBackgroundImg1")
        img.layer.cornerRadius = 25
        img.clipsToBounds = true
        
        descreptionLbl.translatesAutoresizingMaskIntoConstraints = false
        descreptionLbl.numberOfLines = 0
        descreptionLbl.font = UIFont(name: "Chalkboard SE", size: 17)
        descreptionLbl.textColor = #colorLiteral(red: 0.5101799369, green: 0.6269689202, blue: 0.7189044356, alpha: 1)
        descreptionLbl.text = SetLanguage.setLanguage(.aboutAppDescription)
        
        startBtn.translatesAutoresizingMaskIntoConstraints = false
        startBtn.setTitle(SetLanguage.setLanguage(.getStarted), for: .normal)
        startBtn.backgroundColor = #colorLiteral(red: 0.3378773928, green: 0.834186852, blue: 0.07973343879, alpha: 1)
        startBtn.layer.cornerRadius = 10
        startBtn.clipsToBounds = true
        startBtn.addTarget(self, action: #selector(startPressed(_:)), for: .touchUpInside)
        
        addConstraints()
    }

    private func addSubviews(_ views: UIView...){
        views.forEach { elements in
            view.addSubview(elements)
        }
    }
 
    private func addConstraints(){
        NSLayoutConstraint.activate([
            img.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            img.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.size.height * 0.082),
            img.heightAnchor.constraint(equalToConstant: 150),
            img.widthAnchor.constraint(equalToConstant: 150),
            
            descreptionLbl.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25),
            descreptionLbl.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25),
            descreptionLbl.topAnchor.constraint(equalTo: img.bottomAnchor, constant: 21),
            
            startBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -25),
            startBtn.heightAnchor.constraint(equalToConstant: 50),
            startBtn.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            startBtn.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30)
        ])
    }
    
}
