//
//  CreateNewCategory+setupViews.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 02/09/23.
//

import Foundation
import UIKit

extension CreateNewCategory {
    //MARK: setupViews
    func setupViews(){
        view.backgroundColor = .clear
        
        addSubviews(cancelBtn, createBtn, categoryNameTF, favouriteLbl, isFavourite, colorsLbl, stackViewForColorBtns)
        
        miniView.backgroundColor = Constants.backgroundColorForMiniView
        miniView.translatesAutoresizingMaskIntoConstraints = true
        let deviceWidth = view.frame.width
        let deviceHeight = view.frame.height
        miniView.frame = CGRect(x: 0, y: deviceHeight/2, width: deviceWidth, height: deviceHeight/2)
        miniView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        miniView.layer.cornerRadius = 30
        miniView.clipsToBounds = true
        
        cancelBtn.translatesAutoresizingMaskIntoConstraints = false
        cancelBtn.setTitle(SetLanguage.setLanguage(.cancelBtn), for: .normal)
        cancelBtn.setTitleColor(.link, for: .normal)
        cancelBtn.addTarget(self, action: #selector(cancelAction(_:)), for: .touchUpInside)
        
        createBtn.setTitleColor(.link, for: .normal)
        createBtn.setTitle(SetLanguage.setLanguage(.createBtn), for: .normal)
        createBtn.translatesAutoresizingMaskIntoConstraints = false
        createBtn.addTarget(self, action: #selector(createPressed(_:)), for: .touchUpInside)
        
        categoryNameTF.translatesAutoresizingMaskIntoConstraints = false
        categoryNameTF.textColor = Constants.textColor
        
        let atributes: [NSAttributedString.Key : Any] = [
            .foregroundColor : UIColor.lightGray
        ]
        
        let attributedPlaceholder = NSAttributedString(string: SetLanguage.setLanguage(.writeYourCateNamePlaceholder), attributes: atributes)
        
        categoryNameTF.attributedPlaceholder = attributedPlaceholder
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneBtn = UIBarButtonItem(title: SetLanguage.setLanguage(.done), image: nil, target: self, action: #selector(donePressed(_:)))
        toolBar.items = [UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil), doneBtn]
        categoryNameTF.inputAccessoryView = toolBar
        
        favouriteLbl.translatesAutoresizingMaskIntoConstraints = false
        favouriteLbl.text       = SetLanguage.setLanguage(.favourityCateTitle)
        favouriteLbl.font       = UIFont(name: "Noteworthy Bold", size: 19)
        favouriteLbl.textColor  = Constants.textColor
        
        isFavourite.translatesAutoresizingMaskIntoConstraints = false
        isFavourite.isEnabled = true
        
        colorsLbl.translatesAutoresizingMaskIntoConstraints = false
        colorsLbl.text = SetLanguage.setLanguage(.selectColorOfCate)
        colorsLbl.font = UIFont(name: "Noteworthy Bold", size: 19)
        colorsLbl.textColor = Constants.textColor
        
        for colorBtn in 0...6 {
            let btn = UIButton()
            switch colorBtn {
            case 0: btn.backgroundColor = .red
            case 1: btn.backgroundColor = .orange
            case 2: btn.backgroundColor = .systemYellow
            case 3: btn.backgroundColor = .systemGreen
            case 4: btn.backgroundColor = .systemTeal
            case 5: btn.backgroundColor = .systemBlue
            case 6: btn.backgroundColor = .purple
            default:
                break
            }
            NSLayoutConstraint.activate([
                btn.heightAnchor.constraint(equalToConstant: 30),
                btn.widthAnchor.constraint(equalToConstant: 30)
            ])
            btn.layer.cornerRadius = 15
            btn.layer.borderWidth = 5
            
            if colorBtn == colorTag {
                btn.layer.borderColor = borderColor.cgColor
            } else {
                btn.layer.borderColor = UIColor.clear.cgColor
            }
            
            btn.clipsToBounds = true
            btn.tag = colorBtn
            btn.addTarget(self, action: #selector(userSelectedColor(_:)), for: .touchUpInside)
            stackViewForColorBtns.addArrangedSubview(btn)
            colors.append(btn)
        }
        
        stackViewForColorBtns.translatesAutoresizingMaskIntoConstraints = false
        stackViewForColorBtns.axis = .horizontal
        stackViewForColorBtns.spacing = 15
        
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
            cancelBtn.topAnchor.constraint(equalTo: miniView.topAnchor, constant: 10),
            cancelBtn.leftAnchor.constraint(equalTo: miniView.leftAnchor, constant: 15),
            
            createBtn.topAnchor.constraint(equalTo: miniView.topAnchor, constant: 10),
            createBtn.rightAnchor.constraint(equalTo: miniView.rightAnchor, constant: -30),
            
            categoryNameTF.leftAnchor.constraint(equalTo: miniView.leftAnchor, constant: 33),
            categoryNameTF.rightAnchor.constraint(equalTo: miniView.rightAnchor, constant: -33),
            categoryNameTF.topAnchor.constraint(equalTo: miniView.topAnchor, constant: 50),
            categoryNameTF.heightAnchor.constraint(equalToConstant: 50),
            
            favouriteLbl.topAnchor.constraint(equalTo: categoryNameTF.bottomAnchor, constant: 40),
            favouriteLbl.rightAnchor.constraint(equalTo: miniView.rightAnchor, constant: -100),
            
            isFavourite.topAnchor.constraint(equalTo: categoryNameTF.bottomAnchor, constant: 40 ),
            isFavourite.rightAnchor.constraint(equalTo: miniView.rightAnchor, constant: -15),
            
            colorsLbl.centerXAnchor.constraint(equalTo: miniView.centerXAnchor),
            colorsLbl.topAnchor.constraint(equalTo: favouriteLbl.bottomAnchor, constant: 55),
            
            stackViewForColorBtns.centerXAnchor.constraint(equalTo: miniView.centerXAnchor),
            stackViewForColorBtns.topAnchor.constraint(equalTo: colorsLbl.bottomAnchor, constant: 25)
        ])
    }
    
}
