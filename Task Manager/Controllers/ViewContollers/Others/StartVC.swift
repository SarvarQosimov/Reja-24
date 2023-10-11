//
//  StartVC.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 28/07/23.
//

import UIKit

class StartVC: UIViewController {
    
    //MARK: Variables
    let img            = UIImageView()
    let descreptionLbl = UILabel()
    let startBtn       = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
    }
    
    //MARK: startPressed
    @objc func startPressed(_ sender: Any){
        UserDefaults.standard.set(true, forKey: Constants.userDefaultsForAppDelegate)
        let vc = Tabbar()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }    
}
