//
//  Constants.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 22/08/23.
//

import Foundation
import UIKit

struct Constants {
    
    static var mainBackgroundColor: UIColor {
        if UserDefaults.standard.string(forKey: Constants.appMode) == "dark" {
            return #colorLiteral(red: 0.1999999881, green: 0.1999999881, blue: 0.1999999881, alpha: 1)
        } else {
            return #colorLiteral(red: 1, green: 0.9843137255, blue: 0.9019607843, alpha: 1)
        }
    }
   
    static var backgroundColorForMiniView: UIColor {
        if UserDefaults.standard.string(forKey: Constants.appMode) == "dark" {
            return .black
        } else {
            return .white
        }
    }
    
    static var textColor: UIColor {
        if UserDefaults.standard.string(forKey: Constants.appMode) == "dark" {
            return .white
        } else {
            return .black
        }
    }
    
    static var menuBlurEfect: UIBlurEffect.Style {
        if UserDefaults.standard.string(forKey: Constants.appMode) == "dark" {
            return .light
        } else {
            return .systemThinMaterialDark
        }
    }
    
    static var appLanguage                = "appLanguage"
    static var appMode                    = "appMode"
    static let userDefaultsForAppDelegate = "isStarted"
    static let firstNameTfForProfile      = "firstNameTF"
    static let secondNameTfForProfile     = "secondNameTF"
    static let userImageForProfile        = "userImage"
}


