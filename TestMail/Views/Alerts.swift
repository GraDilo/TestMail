//
//  Alerts.swift
//  TestMail
//
//  Created by Эльмир Юсупов on 12.01.2023.
//

import Foundation
import UIKit

struct Alert {
    
    private static func showSimpleAlert(vc: UIViewController, title: String, message: String) {
        
        let AlertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default)
        AlertController.addAction(ok)
        DispatchQueue.main.async {
            vc.present(AlertController, animated: true, completion: nil)
        }
    }
    
    private static func showChangeAlert(vc: UIViewController,
                                       title: String,
                                       message: String,
                                       completion: @escaping() -> Void) {
        let AlertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default) {_ in
            completion()
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        AlertController.addAction(ok)
        AlertController.addAction(cancel)
        DispatchQueue.main.async {
            vc.present(AlertController, animated: true, completion: nil)
        }
    }
    
    static func showResultAlert(vc: UIViewController, message: String) {
        showSimpleAlert(vc: vc, title: "Result", message: message)
    }
    static func showErrorAlert(vc: UIViewController, message: String, completion: @escaping() -> Void) {
        showChangeAlert(vc: vc, title: "Error", message: message, completion: completion)
    }
}
