//
//  SetLanguage.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 27/09/23.
//

import Foundation

class SetLanguage {
    class func setLanguage(_ type: LanguageType) -> String{
        let lang = UserDefaults.standard.string(forKey: Constants.appLanguage)
        if lang == "uz" {
            return getUzValue(type)
        } else if lang == "ru" {
            return getRuValue(type)
        } else {
            return getEngValue(type)
        }
    }
    
    private class func getUzValue(_ type: LanguageType) -> String {
        switch type {
            ///` StartVC
        case .aboutAppDescription:          return """
    "Reja 24" ilovamizga xush kelibsiz. "Reja 24" ilovasi - vazifalarni samarali boshqarish va samaradorlikni oshirish uchun ideal ilova! Bizning ilovamiz yordamida siz tartibli bo'lishingiz va hech narsa unutmaslikka  ishonch hosil qilib, vazifalaringizni bajarishingiz mumkin.
    
    "Reja 24" ilovamizni tanlaganingiz uchun tashakkur.
    """
        case .getStarted:                   return "Boshlash"
            
            ///` ChooseLanguageVC
        case .chooseLanguageLbl:             return "Tilni tanlang"
        case .continueBtn:                   return "Davom ettirish"

            ///`MainVC
        case .homeTitle:                     return "Asosiy"
        case .categoriesTitle:               return "Kategoriyalar"
        case .allBtn:                        return "Yana"
        case .pressPlusForCategoriesMessage: return "Yangi kategoriya qo`shish uchun + bosing"
        case .foldersTitle:                  return "Fayllar"
        case .pressPlusForFoldersMessage:    return "Yangi faly qo`shish uchun + bosing"
        case .tasksForToday:                 return "Bugungi vazifalar"
            
            ///` SettingsVC
        case .languageTitle:                 return "Til"
        case .currentLanguage:               return "O`zbekcha"
        case .darkMode:                      return "Qorong'i rejim"
            
            ///` SideMenu
        case .profileTitle:                  return "Profil"
        case .scheduledTasksTitle:           return "Rejalashtirilgan vazifalar"
        case .settingsTitle:                 return "Sozlamalar"
        case .youHaveTasksMessage:           return "\(SideMenuTV.userName) Sizda \(SideMenuTV.userTasksNumber) ta vazifalar bor"
            
            ///`CreateNewCategoryVC
        case .cancelBtn:                     return "Bekor qilish"
        case .createBtn:                     return "Qo`shish"
        case .writeYourCateNamePlaceholder:  return "Yangi kategoriya nomini kiriting"
        case .favourityCateTitle:            return "Sevimli kategoriya"
        case .selectColorOfCate:             return "Yangi kategoriyangizni rangini tanlang"
            
            ///`CreateNewFolderVC
        case .newFolder:                    return "Yangi fayl"
        case .nameOfNewFolderMessage:       return "Yangi fayl nomini kiriting"
            
            ///`TaksVC
        case .all:                           return "Hammasi"
        case .toDo:                          return "Yangi"
        case .done:                          return "Bajarildi"
        case .addNewTask:                    return "Yangi vazifa qo`shish"
        case .setDedline:                    return "Vaqtni belgilash"
            
            ///`AddNewTaskVC
        case .nameOfNewTask:                 return "Yangi vazifa nomi"
        case .note:                          return "Qo`shimcha ma`lumot"
        case .selectPriority:                return "Muhimlikni tanlang:"
        case .high:                          return "Yuqori"
        case .medium:                        return "O`rtacha"
        case .low:                           return "Past"
        case .addToList:                     return "Ro'yxatga qo'shish"
            
            ///` FolderVC
        case .addCategoriesBtn:              return "Kategoriyalar qo`shish"
        case .delete:                        return "o`chirish"
        case .warningMessage:                return "Kategoriyalarni o`chirmoqchimisiz ?"
            
            ///` ChooseCategoriesVC
        case .addToFolder:                   return "Faylga qo'shish"
            
            ///` TaskDetailVC
        case .task:                          return "Vazifa"
        case .finished:                      return "Bajarildi"
            
            ///` SearchTaskVC
        case .searchTaskTitle:               return "Vazifani qidirish"
        case .searchYourTaskPlaceholder:     return "Kerakli vazifani qidiring"
            
            ///`ProfileVC
        case .firstNamePlaceholder:          return "Ism"
        case .nextBtn:                       return "Keyingisi"
        case .lastNamePlaceholder:           return "Familiya"
        case .save:                          return "Saqlash"
            
            ///`SetTimerVC
        case .setBtn:                        return "O`rnatish"

            ///`FlaggedTasksVC
        case .flaggedTitle:                  return "Belgilangangan vazifalar"
        case .noFlaggedTasksMessage:         return "Sizda belgilangan vazifalar yo`q"
            
            ///`ScheduledVC
        case .noScheduledTasksMessanger:     return "Sizda rejalashtirilgan vazifalar yo'q"
            
            ///`Aditional
        case .editTask:                      return "Vazifani o`zgartirish"
        case .deleteTask:                    return "Vazifani o`chirish"
        case .deleteCategory:                return "Kategoryani o`chirish"
        case .editCategory:                  return "Kategoryani o`zgartirish"
        case .editFolder:                    return "Faylni o`zgartirish"
        case .deleteFolder:                  return "Faylni o`chirish"
        case .nameCannotBeEmptyMessage:      return "Maydon bo`sh bo`lishishi mumkin emas"
         }
    }
    
    private class func getRuValue(_ type: LanguageType) -> String {
        switch type {
            ///` StartVC
        case .aboutAppDescription:           return """
    Добро пожаловать в наше приложение "Reja 24". Приложение "Reja 24"  - ваш идеальный инструмент для эффективного управления задачами и повышения производительности! С помощью нашего приложения вы можете оставаться организованным и справляться со своими задачами, гарантируя, что ничего не выйдет из-под контроля.
    
    Благодарим вас за то, что выбрали наше приложение "Reja 24".
    """
        case .getStarted:                    return "Начать"
            
            ///` ChooseLanguageVC
        case .chooseLanguageLbl:             return "Выберите язык"
        case .continueBtn:                   return "Продолжить"

            ///` MainVC
        case .homeTitle:                     return "Главная"
        case .categoriesTitle:               return "Категории"
        case .allBtn:                        return "все"
        case .pressPlusForCategoriesMessage: return "Hажмите +, чтобы добавить новую категорию"
        case .foldersTitle:                  return "Папки"
        case .pressPlusForFoldersMessage:    return "Hажмите +, чтобы добавить новую папку"
        case .tasksForToday:                 return "Сегодняшние задачи"
            
            ///` SettingsVC
        case .languageTitle:                 return "Язык"
        case .currentLanguage:               return "Русский"
        case .darkMode:                      return "Темный режим"
            
            ///` SideMenu
        case .profileTitle:                  return "Профиль"
        case .scheduledTasksTitle:           return "Запланированные задачи"
        case .settingsTitle:                 return "Настройки"
        case .youHaveTasksMessage:           return "\(SideMenuTV.userName) У Вас eсть \(SideMenuTV.userTasksNumber) задачи"
            
            ///` CreateNewCategoryVC
        case .cancelBtn:                     return "Отменить"
        case .createBtn:                     return "Создать"
        case .writeYourCateNamePlaceholder:  return "Напишите название своей категории"
        case .favourityCateTitle:            return "Ваша любимая категория"
        case .selectColorOfCate:             return "Выберите цвет для новой категории"
            
            ///` CreateNewFolderVC
        case .newFolder:                     return "Новая папка"
        case .nameOfNewFolderMessage:        return "Введите имя новой папки"
            
            ///` TaksVC
        case .all:                           return "Все"
        case .toDo:                          return "Новый"
        case .done:                          return "Сделано"
        case .addNewTask:                    return "Добавить новую задачу"
        case .setDedline:                    return "Установить время"
            
            ///`AddNewTaskVC
        case .nameOfNewTask:                 return "Название новой задачи"
        case .note:                          return "Описание"
        case .selectPriority:                return "Выберите приоритет:"
        case .high:                          return "Высокий"
        case .medium:                        return "Средний"
        case .low:                           return "Низкий"
        case .addToList:                     return "Добавить в список"
            
            ///` FolderVC
        case .addCategoriesBtn:              return "Добавить категории"
        case .delete:                        return "удалить"
        case .warningMessage:                return "Хотите удалить категории ?"
            
            ///` ChooseCategoriesVC
        case .addToFolder:                   return "Добавить в папку"
            
            ///` TaskDetailVC
        case .task:                          return "Задача"
        case .finished:                      return "Завершенный"
            
            ///` SearchTaskVC
        case .searchTaskTitle:               return "Поиск задач"
        case .searchYourTaskPlaceholder:     return "Поиск задач"

            ///`ProfileVC
        case .firstNamePlaceholder:          return "Имя"
        case .nextBtn:                       return "Следующий"
        case .lastNamePlaceholder:           return "Фамилия"
        case .save:                          return "Сохранить"
            
            ///`SetTimerVC
        case .setBtn:                        return "Установить"

            ///`FlaggedTasksVC
        case .flaggedTitle:                  return "С флажком"
        case .noFlaggedTasksMessage:         return "У вас нет никаких задач c флажком"
            
            ///`ScheduledVC
        case .noScheduledTasksMessanger:     return "У вас нет запланированных задач"
            
            ///`Aditional
        case .editTask:                      return "Изменить задачу"
        case .deleteTask:                    return "Удалить задачу"
        case .deleteCategory:                return "Удалить категорию"
        case .editCategory:                  return "Изменить категорию"
        case .editFolder:                    return "Изменить папку"
        case .deleteFolder:                  return "Удалить папку"
        case .nameCannotBeEmptyMessage:      return "Поле не может быть пустым"
        }
    }
    
    private class func getEngValue(_ type: LanguageType) -> String {
        switch type {
            ///` StartVC
        case .aboutAppDescription:           return """
    Welcome to our "Reja 24" app. "Reja 24" app - your ultimate tool for efficient task management and productivity! With our app, you can stay organized and on top of your tasks, ensuring nothing falls through the cracks.
    
    Thank you for choosing our "Reja 24" app.
    """
        case .getStarted:                    return "Get started"
            
            ///` ChooseLanguageVC
        case .chooseLanguageLbl:             return "Choose language"
        case .continueBtn:                   return "Continue"
            
            ///` MainVC
        case .homeTitle:                     return "Home"
        case .categoriesTitle:               return "Categories"
        case .allBtn:                        return "all"
        case .pressPlusForCategoriesMessage: return "Press + to add new category"
        case .foldersTitle:                  return "Folders"
        case .pressPlusForFoldersMessage:    return "Press + to add new folder"
        case .tasksForToday:                 return "Tasks for today"
            
            ///` SettingsVC
        case .languageTitle:                 return "Language"
        case .currentLanguage:               return "English"
        case .darkMode:                      return "Dark mode"
            
            ///` SideMenu
        case .profileTitle:                  return "Profile"
        case .scheduledTasksTitle:           return "Scheduled tasks"
        case .settingsTitle:                 return "Settings"
        case .youHaveTasksMessage:           return "\(SideMenuTV.userName) You have \(SideMenuTV.userTasksNumber) task"
            
            ///` CreateNewCategoryVC
        case .cancelBtn:                     return "Cancel"
        case .createBtn:                     return "Create"
        case .writeYourCateNamePlaceholder:  return "Write your category name"
        case .favourityCateTitle:            return "Favourity category"
        case .selectColorOfCate:             return "Select color of new category"
            
            ///` CreateNewFolderVC
        case .newFolder:                     return "New folder"
        case .nameOfNewFolderMessage:        return "Enter name of new folder"
            
            ///`TaksVC
        case .all:                           return "All"
        case .toDo:                          return "To Do"
        case .done:                          return "Done"
        case .addNewTask:                    return "Add new task"
        case .setDedline:                    return "Set dedline"
            
            ///`AddNewTaskVC
        case .nameOfNewTask:                 return "Name of new task"
        case .note:                          return "Description"
        case .selectPriority:                return "Select priority:"
        case .high:                          return "High"
        case .medium:                        return "Medium"
        case .low:                           return "Low"
        case .addToList:                     return "Add to list"
            
            ///` FolderVC
        case .addCategoriesBtn:              return "Add categories"
        case .delete:                        return "delete"
        case .warningMessage:                return "Do you want to delete categories?"
            
            ///` ChooseCategoriesVC
        case .addToFolder:                   return "Add to folder"
            
            ///` TaskDetailVC
        case .task:                          return "Task"
        case .finished:                      return "Finished"
            
            ///` SearchTaskVC
        case .searchTaskTitle:               return "Search tasks"
        case .searchYourTaskPlaceholder:     return "Search your task"
            
            ///`ProfileVC
        case .firstNamePlaceholder:          return "First name"
        case .nextBtn:                       return "Next"
        case .lastNamePlaceholder:           return "Last name"
        case .save:                          return "Save"

            ///`SetTimerVC
        case .setBtn:                        return "Set"

            ///`Flagged
        case .flaggedTitle:                  return "Flagged"
        case .noFlaggedTasksMessage:         return "You do not have any flagged tasks"
            
            ///`ScheduledVC
        case .noScheduledTasksMessanger:      return "You do not have scheduled tasks"

            ///`Aditional
        case .editTask:                      return "Edit task"
        case .deleteTask:                    return "Delete task"
        case .deleteCategory:                return "Delete category"
        case .editCategory:                  return "Edit category"
        case .editFolder:                    return "Edit folder"
        case .deleteFolder:                  return "Delete folder"
        case .nameCannotBeEmptyMessage:      return "The field cannot be empty"
        }
    }
    
}

enum LanguageType {
    //ChooseLanguageVC
    case chooseLanguageLbl, continueBtn
    //StartVC
    case aboutAppDescription, getStarted
    //MainVC
    case homeTitle, categoriesTitle, allBtn, pressPlusForCategoriesMessage, foldersTitle, pressPlusForFoldersMessage, tasksForToday
    //SettingsVC
    case languageTitle, currentLanguage, darkMode
    //SideMenu
    case profileTitle, scheduledTasksTitle, settingsTitle, youHaveTasksMessage
    //CreateNewCategoryVC
    case cancelBtn, createBtn, writeYourCateNamePlaceholder, favourityCateTitle, selectColorOfCate
    //CreateNewFolderVC
    case newFolder, nameOfNewFolderMessage
    //TaksVC
    case all, toDo, done, addNewTask, setDedline
    //AddNewTaskVC
    case nameOfNewTask, note, selectPriority, high, medium, low, addToList
    //FolderVC
    case addCategoriesBtn, delete, warningMessage
    //ChooseCategoriesVC
    case addToFolder
    //TaskDetailVC
    case task, finished
    //SearchTaskVC
    case searchTaskTitle, searchYourTaskPlaceholder
    //ProfileVC
    case firstNamePlaceholder, nextBtn, lastNamePlaceholder, save
    //SetTimerVC
    case setBtn
    //FlaggedTasksVC
    case flaggedTitle, noFlaggedTasksMessage
    //SchedualedTasksVC
    case noScheduledTasksMessanger
    //Aditional
    case editCategory, editTask, editFolder, deleteCategory, deleteTask, deleteFolder, nameCannotBeEmptyMessage
}
