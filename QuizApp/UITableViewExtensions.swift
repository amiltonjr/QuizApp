//
//  UITableViewExtensions.swift
//  QuizApp
//
//  Created by Rafael Freitas on 04/04/21.
//

import UIKit

extension UITableView {
    func register(_ type: UITableViewCell.Type) -> Void {
        let className = String(describing: type)
        self.register(UINib(nibName: className, bundle: nil
        ), forCellReuseIdentifier: className)
    }
    
    func dequeuCell<T>(for type:T.Type) -> T? {
        return self.dequeueReusableCell(withIdentifier: String(describing: type)) as? T
    }
}
