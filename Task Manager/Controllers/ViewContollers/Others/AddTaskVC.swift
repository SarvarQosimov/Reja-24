//
//  AddTaskVC.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 05/07/23.
//

import UIKit
import CoreData
import UserNotifications

class AddTaskVC: UIViewController {
    
    //MARK: Elements
    let miniView               = UIView()
    let taskTF                 = UITextField()
    let noteTextView           = UITextView()
    let placeholderForTextView = UILabel()
    let addToListBtn           = UIButton()
    var stack                  = UIStackView()
    var priorityButtons        = [UIButton]()
    let addImgBtn              = UIButton()
    let addedImg               = UIImageView()
    let priorityLbl            = UILabel()
    let flagImgBtn             = UIButton()
    let stackForImgAndFlag     = UIStackView()
    var blur: UIBlurEffect {
        if UserDefaults.standard.string(forKey: Constants.appMode) == "dark" {
            return UIBlurEffect(style: .dark)
        } else {
           return UIBlurEffect(style: .systemThinMaterial)
        }
    }
    
    //MARK: Variables
    let contex = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var tasks         = [TaskDB]()
    let taskViewModel = TasksViewModel()
    static var delegate: DataChangedDelegate?
    static var isEditing = (false, TaskDB(), 0)
    var priority = ""
    var isFlagged = false
    
    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
 
    //MARK: donePressed
    @objc func addToListPressed(_ sender: Any) {
        if !taskTF.text!.isEmpty {
          //
            if AddTaskVC.isEditing.0 {
                let numOfTask = AddTaskVC.isEditing.2
                tasks[numOfTask].priority = priority
                tasks[numOfTask].task = taskTF.text
                tasks[numOfTask].note = noteTextView.text
                tasks[numOfTask].image = addedImg.image?.toPngString()
                tasks[numOfTask].isFlagged = self.isFlagged
            } else {
                let newTask = TaskDB(context: contex)
                 newTask.priority = priority
                 newTask.id = Double(TasksVC.whichCategory)
                 newTask.task = taskTF.text
                 newTask.note = noteTextView.text
                 newTask.image = addedImg.image?.toPngString()
                 newTask.isDone = false
                 newTask.dedline = ""
                 newTask.isFlagged = self.isFlagged
                 tasks.append(newTask)
            }
             //
            taskViewModel.save()
            
            AddTaskVC.delegate?.tasksChanged()
             dismiss(animated: true)
        } else {
            let alert = Alert.makeAlertController(SetLanguage.setLanguage(.nameCannotBeEmptyMessage))
            present(alert, animated: true)
        }
    }
 
    @objc func dismissAreaPressed(_ sender: Any) {
        dismiss(animated: true)
    }
    
    //MARK: doneTF
    @objc func doneTF(_ sender: Any){
        taskTF.resignFirstResponder()
    }
    
    @objc func doneTextView(_ sender: Any){
        noteTextView.resignFirstResponder()
    }
   
    //MARK: priorityBtn
    @objc func priorityBtn(_ sender: UIButton){
        for i in 0...2 {
            priorityButtons[i].backgroundColor = .clear
        }
        
        switch sender.tag {
        case 0:
            priorityButtons[sender.tag].backgroundColor = .red
            priority = "High"
        case 1:
            priorityButtons[sender.tag].backgroundColor = .systemYellow
            priority = "Medium"
        default:
            priorityButtons[sender.tag].backgroundColor = .systemGreen
            priority = "Low"
        }
        
    }
    
    //MARK: selectPhoto
    @objc func selectPhoto(_ sender: Any){
        let vc = UIImagePickerController()
        vc.allowsEditing = true
        vc.delegate = self
        vc.sourceType = .photoLibrary
        present(vc, animated: true)
    }
        
    //MARK: flagPressed
    @objc func flagPressed(_ sender: Any){
        if isFlagged {
            flagImgBtn.setImage(UIImage(systemName: "flag"), for: .normal)
        } else {
            flagImgBtn.setImage(UIImage(systemName: "flag.fill"), for: .normal)
        }
        isFlagged = !isFlagged
        
    }
    
    //MARK: setEdit
    ///User editing old task, this function to show old datas about task
    func setEdit(){
        let shouldEdit = AddTaskVC.isEditing.1
        addedImg.image = shouldEdit.image?.toImage()
        taskTF.text = shouldEdit.task
        if let note = shouldEdit.note {
            if note.isEmpty {
                placeholderForTextView.isHidden = false
            } else {
                placeholderForTextView.isHidden = true
            }
        }
        
        noteTextView.text = shouldEdit.note
        
        if shouldEdit.isFlagged {
            flagImgBtn.setImage(UIImage(systemName: "flag.fill"), for: .normal)
            isFlagged = true
        } else {
            isFlagged = false
            flagImgBtn.setImage(UIImage(systemName: "flag"), for: .normal)
        }
        
        tasks = taskViewModel.fetchTasks()
        switch shouldEdit.priority {
        case "High":
            priorityButtons[0].backgroundColor = .red
            priority = "High"
        case "Medium":
            priorityButtons[1].backgroundColor = .systemYellow
            priority = "Medium"
        case "Low":
            priorityButtons[2].backgroundColor = .systemGreen
            priority = "Low"
        default: break
        }
    }
}

//MARK: UIImagePickerControllerDelegate
extension AddTaskVC: UIImagePickerControllerDelegate & UINavigationControllerDelegate  {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.editedImage] as? UIImage
        if image == nil {
            print("nil")
        } else {
            addedImg.image = image
        }
        
        dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
}

extension AddTaskVC: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        if textView.text.isEmpty {
            placeholderForTextView.isHidden = false
        } else {
            placeholderForTextView.isHidden = true
        }
    }
}
