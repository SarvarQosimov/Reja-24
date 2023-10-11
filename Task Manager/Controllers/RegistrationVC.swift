//
//  RegistrationVC.swift
//  ManzilTest
//
//  Created by Sarvar Qosimov on 23/03/23.
//

import UIKit

class RegistrationVC: UIViewController {

    @IBOutlet weak var nameTF: UITextField!
    
    @IBOutlet weak var surnameTF: UITextField!
    
    @IBOutlet weak var phoneNumberTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    @IBAction func registerPressed(_ sender: Any) {
        
        Api.shared.signUp(name: nameTF.text!, surname: surnameTF.text!, phoneNumber: phoneNumberTF.text!) { [self] isRegistrated in
           
            if isRegistrated {
                
                let vc = ConfirmationVC(nibName: "ConfirmationVC", bundle: nil)
                vc.number = phoneNumberTF.text ?? ""
                vc.modalPresentationStyle = .fullScreen
                present(vc, animated: true)
            } else {
                print(false)
            }
        }
    }
    
    
    @IBAction func enterPressed(_ sender: Any) {

        UIApplication.shared.keyWindow?.rootViewController = LoginVC()
        
    }
    
    
}
