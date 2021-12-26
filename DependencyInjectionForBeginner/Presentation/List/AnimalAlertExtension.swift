//
//  AlertControllerExtension.swift
//  DependencyInjectionForBeginner
//
//  Created by pavel mishanin on 21.12.2021.
//

import UIKit

extension UIViewController {
    
    func addElement(title: String, message: String?, complition: @escaping (AnimalDTO2) -> ()) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default) { name in
            let textFirst = alertController.textFields?.first
            let textSecond = alertController.textFields?[1]
            
            guard let textOne = textFirst?.text, let textTwo = textSecond?.text else { return }
            if textOne != "" || textTwo != "" {
                complition(AnimalDTO2.init(name: "\(textOne)", id: "\(textTwo)"))
            }
            
        }
        alertController.addTextField()
        alertController.addTextField()
        alertController.addAction(action)
        
        present(alertController, animated: false, completion: nil)
        
    }
    
}
