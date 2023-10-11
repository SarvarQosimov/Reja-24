//
//  SettingsVC.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 27/09/23.
//

import UIKit

class SettingsVC: UIViewController {

    //MARK: Elements
    let appLanguageBtn       = UIButton()
    let miniView             = UIView()
    let uzLangImg            = UIImageView()
    let ruLangImg            = UIImageView()
    let engLangImg           = UIImageView()
    let uzLngBtn             = UIButton()
    let ruLngBtn             = UIButton()
    let engLngBtn            = UIButton()
    let mainStackView        = UIStackView()
    let darkModeImg          = UIImageView()
    let darkModeLbl          = UILabel()
    let darkModeSwich        = UISwitch()
    let stackViewForDarkMode = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    //MARK: languagePressed
    @objc func languagePressed(_ sender: Any){
        appLanguageBtn.isEnabled = false
        uzLngBtn.backgroundColor = .clear
        ruLngBtn.backgroundColor = .clear
        engLngBtn.backgroundColor = .clear
        
        hideAndUnhideOptions(false)
    }

    //MARK: changeLangPressed
    @objc func changeLangPressed(_ sender: UIButton){
        if sender.tag == 0 {
            UserDefaults.standard.set("uz", forKey: Constants.appLanguage)
        } else if sender.tag == 1{
            UserDefaults.standard.set("ru", forKey: Constants.appLanguage)
        } else if sender.tag == 2 {
            UserDefaults.standard.set("eng", forKey: Constants.appLanguage)
        }
        
        (UIApplication.shared.delegate as? AppDelegate)?.window?.rootViewController = Tabbar()
    }
    
    @objc func cancelGesture(_ sender: Any){
       hideAndUnhideOptions(true)
    }
    
    //MARK: appModeChanged
    @objc func appModeChanged(_ sender: Any){
        let appMode = UserDefaults.standard
        if appMode.string(forKey: Constants.appMode) == "dark" {
            darkModeSwich.isOn = false
           appMode.set("light", forKey: Constants.appMode)
        } else {
            darkModeSwich.isOn = true
            appMode.set("dark", forKey: Constants.appMode)
        }
        (UIApplication.shared.delegate as? AppDelegate)?.window?.rootViewController = Tabbar()
    }
    
    //MARK: hideAndUnhideOptions
    func hideAndUnhideOptions(_ hide: Bool){
        appLanguageBtn.isEnabled = true
        if hide {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                UIView.animate(withDuration: 0.5) {
                    self.miniView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
                } completion: { _ in
                    self.miniView.isHidden = true
                    self.miniView.transform = .identity
                }
            }
        } else {
            miniView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
            miniView.isHidden = false
            UIView.animate(withDuration: 0.5) {
                self.miniView.transform = .identity
            }
        }
    }
    
}
