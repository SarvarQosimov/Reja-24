//
//  LocalNotificationManager.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 18/07/23.
//

import Foundation
import UserNotifications
import UIKit

//MARK: LocalNotificationDurationType
enum LocalNotificationDurationType {
    case days
    case hours
    case minutes
}

//MARK: LocalNotification
struct LocalNotification {
    var id: String
    var title: String
    var body: String
}

//MARK: LocalNotificationManager
struct LocalNotificationManager {
    
    static private var notifications = [LocalNotification]()
    
    //MARK: requestPermission
    static private func requestPermission() -> Void {
        UNUserNotificationCenter.current().requestAuthorization(
            options: [.alert, .badge, .alert]) { granted, error in
                if granted == true && error == nil {
                    // We have permission!
                }
            }
    }
    
    //MARK: addNotfication
    static private func addNotification(title: String, body: String) -> Void {
        notifications.append(LocalNotification(id: UUID().uuidString, title: title, body: body))
    }
    
    //MARK: scheduleNotifications
    static private func scheduleNotifications(
        durationInSecond: Int, repeats: Bool, userInfo: [AnyHashable:Any]){
            UIApplication.shared.applicationIconBadgeNumber = 0
            for notification in notifications {
                let content = UNMutableNotificationContent()
                content.title = notification.title
                content.body = notification.body
                content.sound = UNNotificationSound.default
                content.badge = NSNumber(value: UIApplication.shared.applicationIconBadgeNumber+1)
                content.userInfo = userInfo
                
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(durationInSecond), repeats: repeats)
                let request = UNNotificationRequest(identifier: notification.id, content: content, trigger: trigger)
                
                UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
                UNUserNotificationCenter.current().add(request) { error in
                    print("Scheduling notification with id: \(notification.id)")
                }
            }
            notifications.removeAll()
            
        }
    
    //MARK: convertTimeAndScheduale
    static private func convertTimeAndScheduale(duration: Int, type: LocalNotificationDurationType, repeats: Bool, userInfo: [AnyHashable:Any]){
        var minuts = 0
        switch type {
        case .minutes:
            minuts = duration
        case .hours:
            minuts = duration * 60
        case .days:
            minuts = duration * 60 * 24
        }
        scheduleNotifications(durationInSecond: minuts, repeats: repeats, userInfo: userInfo)
    }
  
    //MARK: setNotification
    static func setNotification(
        title: String, body: String,
        duration: Int, type: LocalNotificationDurationType,
        repeats: Bool, userInfo: [AnyHashable:Any]
    ){
        requestPermission()
        addNotification(title: title, body: body)
        convertTimeAndScheduale(
            duration: duration, type: type,
            repeats: repeats, userInfo: userInfo)
    }
   
    //MARK: cancel
    static func cancel() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
    }
}
