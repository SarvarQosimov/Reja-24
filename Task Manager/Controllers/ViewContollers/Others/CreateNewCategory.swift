//
//  CreateNewCategory.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 02/07/23.
//

import UIKit
import CoreData
let contex = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

class CreateNewCategory: UIViewController {

    //MARK: Elements
    var miniView              = UIView()
    var categoryNameTF        = UITextField()
    var createBtn             = UIButton()
    var cancelBtn             = UIButton()
    var isFavourite           = UISwitch()
    var favouriteLbl          = UILabel()
    var colorsLbl             = UILabel()
    var colors                = [UIButton]()
    var stackViewForColorBtns = UIStackView()
    
    //MARK: Variables
    var categories        = [CategoryDB()]
    var selectedColor     = UIColor()
    var colorTag          = 1
    let categoryViewModel = CategoryViewModel()
    var index: Int?       = 0
    static var categoryChanged: DataChangedDelegate!
    var borderColor: UIColor {
        if UserDefaults.standard.string(forKey: Constants.appMode) == "dark" {
             return .white
        } else {
             return .black
        }
    }
    
    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedColor = .orange
        setupViews()
        if let index = index {
            categories = categoryViewModel.fetchCategories()
            for i in categories.enumerated() where i.offset == index {
                categoryNameTF.text = i.element.nameCategory
                isFavourite.isOn = i.element.isFavourity
                selectedColor = UIColor(hex: i.element.colorCategory!)!
            }
        } else {
            print("nil")
        }
    }
    
    //MARK: @objc functions
    @objc func donePressed(_ sender: Any){
        categoryNameTF.resignFirstResponder()
    }
    
    @objc func cancelAction(_ sender: Any){
        dismiss(animated: true)
    }
    
    @objc func userSelectedColor(_ sender: UIButton){
        for color in 0...6 {
            colors[color].layer.borderColor = UIColor.clear.cgColor
        }
        switch sender.tag {
        case 0:
            colors[sender.tag].layer.borderColor = borderColor.cgColor
            selectedColor = .red
        case 1:
            colors[sender.tag].layer.borderColor = borderColor.cgColor
            selectedColor = .orange
        case 2:
            colors[sender.tag].layer.borderColor = borderColor.cgColor
            selectedColor = .systemYellow
        case 3:
            colors[sender.tag].layer.borderColor = borderColor.cgColor
            selectedColor = .systemGreen
        case 4:
            colors[sender.tag].layer.borderColor = borderColor.cgColor
            selectedColor = .systemTeal
        case 5:
            colors[sender.tag].layer.borderColor = borderColor.cgColor
            selectedColor = .systemBlue
        case 6:
            colors[sender.tag].layer.borderColor = borderColor.cgColor
            selectedColor = .purple
        default:
            break
        }
    }
  
    //MARK: createPressed
    @objc func createPressed(_ sender: Any){
        if !categoryNameTF.text!.isEmpty {
            if let index = index {
                categories[index].nameCategory = categoryNameTF.text!
                categories[index].colorCategory = selectedColor.toHex()
                categories[index].isFavourity = isFavourite.isOn
            } else {
                let newCategory = CategoryDB(context: contex)
                newCategory.nameCategory = categoryNameTF.text!
                newCategory.colorCategory = selectedColor.toHex()
                newCategory.isFavourity = isFavourite.isOn
                newCategory.id = ""
                categories.append(newCategory)
            }
            categoryViewModel.save()
            CreateNewCategory.categoryChanged.categoriesChanged()
            dismiss(animated: true)
        } else {
            let alert = Alert.makeAlertController(SetLanguage.setLanguage(.nameCannotBeEmptyMessage))
            present(alert, animated: true)
        }
       
    }
    
}
