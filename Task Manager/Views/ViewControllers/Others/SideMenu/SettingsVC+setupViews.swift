//
//  SettingsVC+setupViews.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 27/09/23.
//

import Foundation
import UIKit

extension SettingsVC {
    func setupViews(){
        view.backgroundColor = Constants.mainBackgroundColor
        print(view.frame.size.height, "view.frame.size.height")
        let hideMiniViewGesture = UITapGestureRecognizer(target: self, action: #selector(cancelGesture(_:)))
        hideMiniViewGesture.numberOfTapsRequired = 1
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(hideMiniViewGesture)
        
        navigationController?.navigationBar.backgroundColor = Constants.mainBackgroundColor
        
        addSubviews()
        
        appLanguageBtn.translatesAutoresizingMaskIntoConstraints = false
        appLanguageBtn.setTitle(
            "   \(SetLanguage.setLanguage(.languageTitle)):     \(SetLanguage.setLanguage(.currentLanguage))",
            for: .normal
        )
        appLanguageBtn.setTitleColor(Constants.textColor, for: .normal)
        appLanguageBtn.titleLabel?.font = UIFont(name: "American Typewriter Bold", size: 21)
        appLanguageBtn.setImage(UIImage(systemName: "globe"), for: .normal)
        appLanguageBtn.addTarget(self, action: #selector(languagePressed(_:)), for: .touchUpInside)
        
        miniView.translatesAutoresizingMaskIntoConstraints = false
        miniView.backgroundColor = Constants.mainBackgroundColor
        miniView.layer.cornerRadius = 33
        miniView.clipsToBounds = true
        miniView.isHidden = true
        
        let borderColor: UIColor!
        if UserDefaults.standard.string(forKey: Constants.appMode) == "dark" {
             borderColor = .white
        } else {
            borderColor = .black
        }
        
        miniView.layer.borderColor = borderColor.cgColor
        miniView.layer.borderWidth = 3
        
        uzLangImg.image = UIImage(named: "uzFlag")
        ruLangImg.image = UIImage(named: "ruFlag")
        engLangImg.image = UIImage(named: "engFlag")
       
        uzLangImg.layer.cornerRadius = 5
        ruLangImg.layer.cornerRadius = 5
        engLangImg.layer.cornerRadius = 5
       
        uzLangImg.clipsToBounds = true
        ruLangImg.clipsToBounds = true
        engLangImg.clipsToBounds = true
        
        uzLngBtn.setTitle("   O`zbekcha", for: .normal)
        ruLngBtn.setTitle("   Русский", for: .normal)
        engLngBtn.setTitle("   English", for: .normal)
        
        uzLngBtn.setTitleColor(.black, for: .normal)
        ruLngBtn.setTitleColor(.black, for: .normal)
        engLngBtn.setTitleColor(.black, for: .normal)
        
        uzLngBtn.setTitleColor(Constants.textColor, for: .normal)
        ruLngBtn.setTitleColor(Constants.textColor, for: .normal)
        engLngBtn.setTitleColor(Constants.textColor, for: .normal)
        
        uzLngBtn.setImage(UIImage(named: "uzFlag"), for: .normal)
        ruLngBtn.setImage(UIImage(named: "ruFlag"), for: .normal)
        engLngBtn.setImage(UIImage(named: "engFlag"), for: .normal)
        
        uzLngBtn.layer.cornerRadius = 5
        ruLngBtn.layer.cornerRadius = 5
        engLngBtn.layer.cornerRadius = 5
        uzLngBtn.clipsToBounds = true
        ruLngBtn.clipsToBounds = true
        engLngBtn.clipsToBounds = true
        
        uzLngBtn.tag = 0
        ruLngBtn.tag = 1
        engLngBtn.tag = 2
        
        uzLngBtn.addTarget(self, action: #selector(changeLangPressed(_:)), for: .touchUpInside)
        ruLngBtn.addTarget(self, action: #selector(changeLangPressed(_:)), for: .touchUpInside)
        engLngBtn.addTarget(self, action: #selector(changeLangPressed(_:)), for: .touchUpInside)
        
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.axis = .vertical
        mainStackView.spacing = 15
        
        mainStackView.alignment = .top
        mainStackView.distribution = .fillEqually
        
        darkModeImg.image = UIImage(systemName: "moonphase.last.quarter")
        
        darkModeLbl.text = SetLanguage.setLanguage(.darkMode)
        darkModeLbl.textColor = Constants.textColor
        
        if UserDefaults.standard.string(forKey: Constants.appMode) == "dark" {
            darkModeSwich.isOn = true
        } else {
            darkModeSwich.isOn = false
        }
        darkModeSwich.addTarget(self, action: #selector(appModeChanged(_:)), for: .touchUpInside)
        
        stackViewForDarkMode.translatesAutoresizingMaskIntoConstraints = false
        stackViewForDarkMode.axis = .horizontal
        stackViewForDarkMode.spacing = 15
        
        addConstraints()
    }
    
    private func addSubviews(){
        view.addSubview(appLanguageBtn)
        view.addSubview(miniView)

        mainStackView.addArrangedSubview(uzLngBtn)
        mainStackView.addArrangedSubview(ruLngBtn)
        mainStackView.addArrangedSubview(engLngBtn)
        miniView.addSubview(mainStackView)
        
        view.addSubview(stackViewForDarkMode)
        stackViewForDarkMode.addArrangedSubview(darkModeImg)
        stackViewForDarkMode.addArrangedSubview(darkModeLbl)
        stackViewForDarkMode.addArrangedSubview(darkModeSwich)
    }
    
    private func addConstraints(){
        NSLayoutConstraint.activate([
            appLanguageBtn.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            appLanguageBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.size.height * 0.117),
            
            miniView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 55),
            miniView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -55),
            miniView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            miniView.heightAnchor.constraint(equalToConstant: 175),
            
            uzLangImg.heightAnchor.constraint(equalToConstant: 39),
            uzLangImg.widthAnchor.constraint(equalToConstant: 39),
            
            ruLangImg.heightAnchor.constraint(equalToConstant: 39),
            ruLangImg.widthAnchor.constraint(equalToConstant: 39),
            
            engLangImg.heightAnchor.constraint(equalToConstant: 39),
            engLangImg.widthAnchor.constraint(equalToConstant: 39),

            mainStackView.leftAnchor.constraint(equalTo: miniView.leftAnchor, constant: 15),
            mainStackView.rightAnchor.constraint(equalTo: miniView.rightAnchor, constant: -15),
            mainStackView.topAnchor.constraint(equalTo: miniView.topAnchor, constant: 15),
            mainStackView.bottomAnchor.constraint(equalTo: miniView.bottomAnchor, constant: -15),
            
            darkModeImg.heightAnchor.constraint(equalToConstant: 25),
            darkModeImg.widthAnchor.constraint(equalToConstant: 25),
            
            stackViewForDarkMode.leftAnchor.constraint(equalTo: appLanguageBtn.leftAnchor, constant: 0),
            stackViewForDarkMode.topAnchor.constraint(equalTo: appLanguageBtn.bottomAnchor, constant: 15),
            
        ])
    }
    
}
