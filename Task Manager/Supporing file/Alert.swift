//
//  WarningAlerts.swift
//  Task Manager
//
//  Created by Sarvar Qosimov on 03/10/23.
//

import Foundation
import UIKit

class Alert {
    class func makeAlertController(_ message: String) -> UIAlertController {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
       
        let action = UIAlertAction(title: "OK", style: .cancel)
        
        alert.addAction(action)
        return alert
    }
}
