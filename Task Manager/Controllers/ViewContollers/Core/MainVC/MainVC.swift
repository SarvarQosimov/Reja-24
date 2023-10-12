//
//  MainVC.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 13/08/23.
//

import UIKit
import CoreData
import SideMenu

class MainVC: UIViewController {
    
    //MARK: Elements
    var tableView: UITableView!
    let loader = UIActivityIndicatorView()
    let menu = SideMenuNavigationController(rootViewController: SideMenuTV(style: .plain))
    
    //MARK: Variables
    let contex = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var folders       = [FolderDB()]
    var tasks         = [TaskDB]()
    let taskViewModel = TasksViewModel()
    var isViewDidLoad = false
    static var folderChanged: DataChangedDelegate!
    
    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupIndecator()
        loader.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: .now()+0.5) { [self] in
            isViewDidLoad = true
            loader.stopAnimating()
            setupViews()
            setupTableView()
        }
        openVcDelegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if isViewDidLoad {
            navigationController?.navigationBar.backgroundColor = Constants.mainBackgroundColor
            navigationController?.navigationBar.tintColor = .systemBlue
        }
    }
    
    //MARK: menuPressed
    @objc func menuPressed(_ sender: Any){
        tasks = taskViewModel.fetchTasks()
        SideMenuTV.userTasksNumber = tasks.count
        SideMenuTV.userName = UserDefaults.standard.string(forKey: Constants.secondNameTfForProfile) ?? ""
        setupSideMenu()
        present(SideMenuManager.default.leftMenuNavigationController!, animated: true)
    }
    
    //MARK: searchPressed
    @objc func searchPressed(_ sender: Any){
        let vc = SearchTasksVC()
        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK: searchPressed
    func setupIndecator(){
        view.addSubview(loader)
        loader.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loader.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loader.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loader.widthAnchor.constraint(equalToConstant: 50),
            loader.heightAnchor.constraint(equalToConstant: 50)
        ])
        loader.hidesWhenStopped = true
        loader.style = .large
        if UserDefaults.standard.string(forKey: Constants.appMode) == "dark" {
            loader.color = .white
        } else {
            loader.color = .darkGray
        }
    }
    
    //MARK: presentNewFolderAlert
    func presentNewFolderAlert() {
        let alertController = UIAlertController(title: SetLanguage.setLanguage(.newFolder), message: nil, preferredStyle: .alert)
        alertController.addTextField { textField in
            textField.placeholder = SetLanguage.setLanguage(.nameOfNewFolderMessage)
        }
        let createAction = UIAlertAction(title: SetLanguage.setLanguage(.createBtn), style: .default) { [self] _ in
            if let textField = alertController.textFields?.first, let text = textField.text {
                if !text.isEmpty {
                    let newFolder = FolderDB(context: contex)
                    newFolder.name = text
                    folders.append(newFolder)
                    taskViewModel.save()
                    MainVC.folderChanged.foldersChanged()
                }
            }
        }
        let cancelAction = UIAlertAction(title: SetLanguage.setLanguage(.cancelBtn), style: .cancel)
        alertController.addAction(createAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
    
    //MARK: setupSideMenu
     func setupSideMenu() {
        SideMenuTV.userTasksNumber = tasks.count
        menu.blurEffectStyle = Constants.menuBlurEfect
        menu.setNavigationBarHidden(true, animated: false)
        menu.navigationBar.backgroundColor = .clear
        menu.isNavigationBarHidden = true
        SideMenuManager.default.leftMenuNavigationController = menu
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
    }
}


