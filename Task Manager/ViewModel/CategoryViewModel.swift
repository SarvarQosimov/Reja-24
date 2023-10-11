//
//  CategoryViewModel.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 24/07/23.
//

import Foundation
import UIKit
import CoreData

//protocol CategoryViewModelDelegate {
//    func updatedCategories()
//}

class CategoryViewModel {
    //MARK: Variables
    let contex = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let taskViewModel    = TasksViewModel()
    var updateCategories : DataChangedDelegate!
    var categories       = [CategoryDB]()
    var tasks            = [TaskDB]()
    var cnt              = 0
    
    //MARK: save
    func save(){
        do {
            try contex.save()
        } catch {
            print("error -> \(error)")
        }
    }
    
    //MARK: fetchCategories
    func fetchCategories() -> [CategoryDB]{
        let request:  NSFetchRequest<CategoryDB> = CategoryDB.fetchRequest()
        do {
            categories = try contex.fetch(request)
        } catch {
            print("error -> \(error)")
        }
        return categories
    }
    
    //MARK: deleteCategory
    func deleteCategory(index: Int) -> [CategoryDB]{
        categories = fetchCategories()
        contex.delete(categories[index])
        categories.remove(at: index)
        save()
        
        return categories
    }
    
    //MARK: deleteTasks
    func removeTasksOfDeletedCategory(index: Int){
        tasks = taskViewModel.fetchTasks()
        for task in tasks.enumerated() {
            if Int(task.element.id) == index {
                contex.delete(tasks[task.offset-cnt])
                tasks.remove(at: task.offset-cnt)
                cnt += 1
            }
        }
        cnt = 0
        for task in tasks.enumerated() {
            if Int(task.element.id) > index {
                tasks[task.offset].id -= 1
            }
        }
        save()
    }
}
