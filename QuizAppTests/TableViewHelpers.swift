//
//  TableViewHelpers.swift
//  QuizAppTests
//
//  Created by Rafael Freitas on 11/03/21.
//

import UIKit

extension UITableView {
    func cell(row: Int = 0, section: Int = 0) -> UITableViewCell {
        self.dataSource?.tableView(self, cellForRowAt: IndexPath(row: row, section: section)) ?? UITableViewCell()
    }
    
    func title(at row: Int = 0) -> String? {
        cell(row: row).textLabel?.text
    }
    
    func select(row: Int = 0) {
        let indexPath = IndexPath(row: row, section: 0)
        selectRow(at: indexPath, animated: false, scrollPosition: .none)
        delegate?.tableView?(self, didSelectRowAt: IndexPath(row:row, section: 0))
    }
    
    func deselect(row: Int = 0) {
        let indexPath = IndexPath(row: row, section: 0)
        deselectRow(at: indexPath, animated: true)
        delegate?.tableView?(self, didDeselectRowAt: IndexPath(row:row, section: 0))
    }
}
