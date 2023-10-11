//
//  SetTimer.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 19/07/23.
//

import UIKit
import CoreData

class SetTimer: UIViewController {
   
    //MARK: Elements
    let miniView       = UIView()
    let cancelBtn      = UIButton()
    let datePicker     = UIDatePicker()
    let setBtn         = UIButton()
    let miniCancelView = UIView()
    
    //MARK: VARIABLES
    let contex = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    static var title    = ""
    static var dedline  = ""
    static var priority = ""
    static var beforSet = TaskDB()
    static var delegate: DataChangedDelegate!
    var tasks = [TaskDB]()
    static var whichTask = 0
    let taskViewModel = TasksViewModel()
   
    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
   
    //MARK: setPressed
    @objc func setPressed(_ sender: Any){
        let sinceNow = Int(datePicker.date.timeIntervalSinceNow)
        if sinceNow > 0 {
            // set notification
            let dedlineText = getCorrectDate(date: "\(datePicker.date)")
            SetTimer.dedline = String(dedlineText.dropLast(5))
            LocalNotificationManager.setNotification(
                title: SetTimer.title,
                body: SetTimer.dedline,
                duration: Int(sinceNow),
                type: .minutes,
                repeats: false,
                userInfo: ["aps":["a":"q"]]
            )
            // upadate dataBase
//            fetchTasks()
            tasks = taskViewModel.fetchTasks()
            tasks[SetTimer.whichTask].dedline = dedlineText
            taskViewModel.save()
            SetTimer.delegate.tasksChanged()
            dismiss(animated: true)
        }
    }
    
    @objc func cancelPresssed(_ sender: Any){
        dismiss(animated: true)
    }
    
    //MARK: getCorrectDate
    func getCorrectDate(date: String) -> String {
        var shouldChangeIndex = 0
        var uzbTimeStr = ""
        var uzbTime = 0
        var result = ""
        for i in date.enumerated() {
            if i.element == " " {
                shouldChangeIndex = i.offset+1
                break
            }
        }
        
        for i in date.enumerated(){
            if i.offset == shouldChangeIndex || i.offset == shouldChangeIndex+1 {
                uzbTimeStr.append(i.element)
            }
        }
        
        uzbTime = Int(uzbTimeStr)!
        uzbTime += 5
        
        for i in date.enumerated(){
            if i.offset == shouldChangeIndex {
                result.append("at \(uzbTime)")
            } else if i.offset == shouldChangeIndex+1 {
                //
            } else {
                result.append("\(i.element)")
            }
        }
        return result
    }
        
    //MARK: save
//    func save(){
//        do{
//            try contex.save()
//        } catch{
//            print("error->")
//        }
//    }
    
    //MARK: fetchTasks
//    func fetchTasks(){
//        let request:  NSFetchRequest<TaskDB> = TaskDB.fetchRequest()
//        do {
//            tasks = try contex.fetch(request)
//        } catch {
//            print("error -> \(error)")
//        }
//    }
}
