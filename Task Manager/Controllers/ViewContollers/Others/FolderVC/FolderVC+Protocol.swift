//
//  FolderVC+setupViews.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 06/10/23.
//

import Foundation
import UIKit

//MARK: CategoriesInFolderDelegate
extension FolderVC: CategoriesInFolderDelegate {
    func getCategories(_ selectedIndexs: [Int]) {
        categories = viewModel.fetchCategories()
        sortByFolder()
        for i in selectedIndexs {
            self.selectedIndexs.append(i)
        }
    }
}
