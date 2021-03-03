//
//  QuestionViewController.swift
//  QuizApp
//
//  Created by Rafael Freitas on 02/03/21.
//

import UIKit

class QuestionViewController: UIViewController {
    private var question: String?
    private var options = [String]()
    private var selection: (([String]) -> Void)? = nil
    private let cellIdentifier = "Cell"
    
    @IBOutlet weak private(set) var headerLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    convenience init(question: String, options: [String], selection: @escaping ([String]) -> Void) {
        self.init()
        self.question = question
        self.options = options
        self.selection = selection
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.headerLabel.text = question
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    private func dequeueCell(in tableView: UITableView) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) {
            return cell
        }
        return UITableViewCell(style: .default, reuseIdentifier: cellIdentifier)
    }
}

//MARK: - UITableViewDataSource

extension QuestionViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dequeueCell(in: tableView)
        cell.textLabel?.text = options[indexPath.row]
        return cell
    }
}

//MARK: - UITableViewDelegate

extension QuestionViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selection?([options[indexPath.row]])
    }
}
