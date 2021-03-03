//
//  QuestionViewController.swift
//  QuizApp
//
//  Created by Rafael Freitas on 02/03/21.
//

import UIKit

class QuestionViewController: UIViewController {
    var question: String?
    var options: [String] = []
    
    @IBOutlet weak private(set) var headerLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    convenience init(question: String, options: [String]) {
        self.init()
        self.question = question
        self.options = options
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.headerLabel.text = question
        self.tableView.dataSource = self
    }
}


extension QuestionViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = options[indexPath.row]
        return cell
    }
}
