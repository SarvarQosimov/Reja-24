//
//  FolderViewModel.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 18/09/23.
//

import UIKit
import CoreData

class FolderViewModel {
    let contex = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var folders = [FolderDB]()
    
    //MARK: fetchFolders
    func fetchFolders() -> [FolderDB]{
        let request: NSFetchRequest<FolderDB> = FolderDB.fetchRequest()
        do {
            folders = try contex.fetch(request)
        } catch {
            print("error -> \(error)")
        }
        
        return folders
    }
    
     //MARK: deleteFolder
     func deleteFolder(index: Int) -> [FolderDB]{
         folders = fetchFolders()
         contex.delete(folders[index])
         folders.remove(at: index)
         save()
 
         return folders
     }
    
    //MARK: save
    func save(){
        do {
            try contex.save()
        } catch {
            print("error -> \(error)")
        }
    }
}
