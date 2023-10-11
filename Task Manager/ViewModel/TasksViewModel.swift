//
//  TasksViewModel.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 25/07/23.
//

import Foundation
import CoreData
import UIKit

class TasksViewModel {
    
    let contex = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var tasks       = [TaskDB]()
    var sortedTasks = [TaskDB]()
    
    //MARK: save
    func save(){
        do{
            try contex.save()
        } catch{
            print("error->")
        }
    }
    
    //MARK: fetchTasks
    func fetchTasks() -> [TaskDB] {
        let request:  NSFetchRequest<TaskDB> = TaskDB.fetchRequest()
        do {
            tasks = try contex.fetch(request)
        } catch {
            print("error -> \(error)")
        }
        return tasks
    }
        
    //MARK: deleteTask
    func deleteTask(indexPathRow: Int, selectedIndex: Int)
    {
       tasks = fetchTasks()
        let deleteIndex = findSelectedIndex(selectedIndex: selectedIndex,  index: indexPathRow)
        if deleteIndex < tasks.count {
            contex.delete(tasks[deleteIndex])
            self.tasks.remove(at: deleteIndex)
        }
    }
    
    //MARK: sortingTasks
    func sortingTasks(_ selectedIndex: Int) -> [TaskDB]{
        tasks = fetchTasks()
        sortedTasks = [TaskDB]()
        for i in tasks {
            switch selectedIndex {
            case 1:
                if !i.isDone && i.id == Double(TasksVC.whichCategory){
                    sortedTasks.append(i)
                }
            case 2:
                if i.isDone && i.id == Double(TasksVC.whichCategory){
                    sortedTasks.append(i)
                }
            default:
                if i.id == Double(TasksVC.whichCategory){
                    sortedTasks.append(i)
                }
            }
        }
        return sortedTasks
    }
    
    //MARK: finishTask
    func finishTask(_ index: Int, selectedIndex: Int){
        tasks = fetchTasks()
        let doneIndex = findSelectedIndex(selectedIndex: selectedIndex, index: index)
        tasks[doneIndex].isDone = !tasks[doneIndex].isDone
        save()
    }
    
    //MARK: taskIsNotEditing
    func taskIsNotEditing(){
        AddTaskVC.isEditing = (false, TaskDB(), 0)
    }
    
    //MARK: taskIsEditing
    func taskIsEditing(selectedIndex: Int, index: Int){
        let editIndex = findSelectedIndex(selectedIndex: selectedIndex, index: index)
        AddTaskVC.isEditing = (true, tasks[editIndex],editIndex)
    }
    
    //MARK: findSelectedIndex
    func findSelectedIndex(selectedIndex: Int, index: Int) -> Int {
        tasks = fetchTasks()
    var cnt = -1
    for i in tasks.enumerated() {
        switch selectedIndex {
        case 0:
            if Int(i.element.id) == TasksVC.whichCategory{
                cnt += 1
            }
        case 1:
            if !i.element.isDone && Int(i.element.id) == TasksVC.whichCategory {
                cnt += 1
            }
        case 2:
            if i.element.isDone && Int(i.element.id) == TasksVC.whichCategory {
                cnt += 1
            }
        default:
            cnt += 1
        }
        
        if cnt == index {
            return i.offset
        }
    }
        return 0
    }
}
