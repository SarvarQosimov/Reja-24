//
//  ProfileVC+setupViews.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 01/09/23.
//

import Foundation
import UIKit

extension ProfileVC {
    //MARK: setupViews
    func setupViews(){
        view.backgroundColor = Constants.mainBackgroundColor
        navigationController?.navigationBar.backgroundColor = #colorLiteral(red: 0.4701875448, green: 0.8683720231, blue: 0.725059092, alpha: 1)
        
        addSubviews()
        
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.backgroundColor = #colorLiteral(red: 0.4701875448, green: 0.8683720231, blue: 0.725059092, alpha: 1)
        
        userImg.translatesAutoresizingMaskIntoConstraints = false
        userImg.tintColor = .brown
        userImg.clipsToBounds = true
        userImg.image = UIImage(systemName: "person")
        let imgTapped = UITapGestureRecognizer(target: self, action: #selector(selectPhoto(_:)))
        imgTapped.numberOfTapsRequired = 1
        userImg.isUserInteractionEnabled = true
        userImg.addGestureRecognizer(imgTapped)
        
        
        firstNameTF.translatesAutoresizingMaskIntoConstraints = false
        firstNameTF.placeholder = SetLanguage.setLanguage(.firstNamePlaceholder)
        firstNameTF.borderStyle = .roundedRect
        firstNameTF.layer.cornerRadius = 10
        firstNameTF.layer.borderWidth = 1.0
        firstNameTF.layer.borderColor = UIColor.gray.cgColor
        firstNameTF.clipsToBounds = true
        let toolBarDone = UIToolbar()
        toolBarDone.sizeToFit()
        let btnDone = UIBarButtonItem(title: SetLanguage.setLanguage(.done), image: nil, target: self, action: #selector(doneTF(_:)))
        toolBarDone.items = [UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil), btnDone]
        firstNameTF.inputAccessoryView = toolBarDone
        
        secondNameTF.translatesAutoresizingMaskIntoConstraints = false
        secondNameTF.placeholder = SetLanguage.setLanguage(.lastNamePlaceholder)
        secondNameTF.borderStyle = .roundedRect
        secondNameTF.layer.cornerRadius = 10
        secondNameTF.layer.borderWidth = 1.0
        secondNameTF.layer.borderColor = UIColor.gray.cgColor
        secondNameTF.clipsToBounds = true
        let toolBarNext = UIToolbar()
        toolBarNext.sizeToFit()
        let btnNext = UIBarButtonItem(title: SetLanguage.setLanguage(.nextBtn), image: nil, target: self, action: #selector(nextTF(_:)))
        
        toolBarNext.items = [UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil), btnNext]
        secondNameTF.inputAccessoryView = toolBarNext

        
        saveBtn.translatesAutoresizingMaskIntoConstraints = false
        saveBtn.setTitle(SetLanguage.setLanguage(.save), for: .normal)
        saveBtn.setTitleColor(.white, for: .normal)
        saveBtn.titleLabel?.font = UIFont(name: "Impact", size: 25)
        saveBtn.backgroundColor = #colorLiteral(red: 0.2745098039, green: 0.2745098039, blue: 0.2745098039, alpha: 1)
        saveBtn.layer.cornerRadius = 15
        saveBtn.clipsToBounds = true
        saveBtn.addTarget(self, action: #selector(savePressed(_:)), for: .touchUpInside)
        
        addConstraints()
    }

    //MARK: addSubviews
    private func addSubviews(){
        view.addSubview(topView)
        view.addSubview(userImg)
        view.addSubview(firstNameTF)
        view.addSubview(secondNameTF)
        view.addSubview(saveBtn)
    }
    
    //MARK: addConstraints
    private func addConstraints(){
        let width = view.frame.width
        topView.layer.cornerRadius = width/2
        
        NSLayoutConstraint.activate([
            topView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: -50),
            topView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 50),
            topView.topAnchor.constraint(equalTo: view.topAnchor, constant: -width/2),
            topView.heightAnchor.constraint(equalToConstant: width),
            
            userImg.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            userImg.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userImg.heightAnchor.constraint(equalToConstant: 100),
            userImg.widthAnchor.constraint(equalToConstant: 100),
            
            firstNameTF.topAnchor.constraint(equalTo: secondNameTF.bottomAnchor, constant: 25),
            firstNameTF.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            firstNameTF.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
            firstNameTF.heightAnchor.constraint(equalToConstant: 50),
            
            secondNameTF.topAnchor.constraint(equalTo: userImg.bottomAnchor, constant: 33),
            secondNameTF.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            secondNameTF.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
            secondNameTF.heightAnchor.constraint(equalToConstant: 50),
            
            saveBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -33),
            saveBtn.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 11),
            saveBtn.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -11),
            saveBtn.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
}
