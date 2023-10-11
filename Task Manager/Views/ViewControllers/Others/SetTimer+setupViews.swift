//
//  SetTimer+setupViews.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 30/08/23.
//

import Foundation
import UIKit

extension SetTimer {
    //MARK: setupViews
    func setupViews(){
        
        addSubviews(miniCancelView, datePicker, setBtn, cancelBtn)
        
        view.backgroundColor = .clear
        miniView.translatesAutoresizingMaskIntoConstraints = false
        miniView.backgroundColor = Constants.backgroundColorForMiniView
        miniView.layer.maskedCorners = CACornerMask([.layerMinXMinYCorner, .layerMaxXMinYCorner])
        miniView.layer.cornerRadius = 25
        miniView.clipsToBounds = true
        
        miniCancelView.translatesAutoresizingMaskIntoConstraints = false
        miniCancelView.backgroundColor = .white
        miniCancelView.layer.cornerRadius = 2
        miniCancelView.clipsToBounds = true
        
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.backgroundColor = .systemGray4
        datePicker.layer.cornerRadius = 5
        datePicker.clipsToBounds = true
        
        setBtn.translatesAutoresizingMaskIntoConstraints = false
        setBtn.setTitle(SetLanguage.setLanguage(.setBtn), for: .normal)
        let setColor = #colorLiteral(red: 0.2750142515, green: 0.5995237231, blue: 0.625458777, alpha: 1)
        setBtn.setTitleColor(setColor, for: .normal)
        setBtn.titleLabel?.font = .boldSystemFont(ofSize: 25)
        setBtn.addTarget(self, action: #selector(setPressed(_:)), for: .touchUpInside)
        
        cancelBtn.translatesAutoresizingMaskIntoConstraints = false
        cancelBtn.setTitle(SetLanguage.setLanguage(.cancelBtn), for: .normal)
        cancelBtn.setTitleColor(.link, for: .normal)
        cancelBtn.backgroundColor = .clear
        cancelBtn.addTarget(self, action: #selector(cancelPresssed(_:)), for: .touchUpInside)
        
        addConstraints()
    }
    
    private func addSubviews(_ views: UIView...){
        view.addSubview(miniView)
        views.forEach { element in
            miniView.addSubview(element)
        }
    }
    
    private func addConstraints(){
        NSLayoutConstraint.activate([
            miniView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            miniView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            miniView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            miniView.heightAnchor.constraint(equalToConstant: 150),
            
            miniCancelView.heightAnchor.constraint(equalToConstant: 15),
            miniCancelView.heightAnchor.constraint(equalToConstant: 30),
            miniCancelView.centerXAnchor.constraint(equalTo: miniView.centerXAnchor),
            miniCancelView.bottomAnchor.constraint(equalTo: miniView.topAnchor, constant: 15),
            
            datePicker.rightAnchor.constraint(equalTo: miniView.rightAnchor, constant: -10),
            datePicker.bottomAnchor.constraint(equalTo: setBtn.topAnchor, constant: -5),
            
            setBtn.centerXAnchor.constraint(equalTo: miniView.centerXAnchor),
            setBtn.bottomAnchor.constraint(equalTo: miniView.bottomAnchor, constant: -20),
            
            cancelBtn.leftAnchor.constraint(equalTo: miniView.leftAnchor, constant: 10),
            cancelBtn.topAnchor.constraint(equalTo: miniView.topAnchor, constant: 10)
        ])
    }

    
}
