//
//  SideMenuTV.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 21/07/23.
//

import Foundation
import UIKit

class SideMenuTV: UITableViewController {
    
    static var userTasksNumber = 0 
    static var userName = UserDefaults.standard.string(forKey: Constants.secondNameTfForProfile) ?? ""
    
    override init(style: UITableView.Style) {
        super.init(style: style)
        view.backgroundColor = #colorLiteral(red: 0.4756349325, green: 0.4756467342, blue: 0.4756404161, alpha: 1)
        view.layer.maskedCorners = CACornerMask([.layerMaxXMinYCorner, .layerMaxXMaxYCorner])
        view.layer.cornerRadius = 15
        view.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    //MARK: cellForRowAt
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.textColor = .white
        cell.backgroundColor = .clear
        cell.imageView?.tintColor = .lightGray
        cell.selectionStyle = .none
        if indexPath.row == 0 {
            cell.textLabel?.text = SetLanguage.setLanguage(.profileTitle)
            cell.imageView?.image = UIImage(systemName: "person")
        } else if indexPath.row == 1 {
            cell.textLabel?.text = SetLanguage.setLanguage(.scheduledTasksTitle)
            cell.imageView?.image = UIImage(systemName: "clock.badge.checkmark")
        } else if indexPath.row == 2 {
            cell.textLabel?.text = SetLanguage.setLanguage(.settingsTitle)
            cell.imageView?.image = UIImage(systemName: "gear")
        } else {
            if !SideMenuTV.userName.isEmpty {
                SideMenuTV.userName = SideMenuTV.userName + ","
            }
            cell.textLabel?.text = SetLanguage.setLanguage(.youHaveTasksMessage)
            cell.textLabel?.font = UIFont(name: "Avenir Next Heavy", size: 21)
            cell.textLabel?.textColor = #colorLiteral(red: 0, green: 0.9797974229, blue: 0.9090745449, alpha: 1)
        }
        cell.textLabel?.numberOfLines = 0
        return cell
    }
    
    //MARK: didSelectRowAt
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let vc = ProfileVC()
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
        case 1:
            let vc = ScheduledTasksVC()
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
        case 2:
            let vc = SettingsVC()
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
        default: break 
        }
    }
    
}
