//
//  ResultsViewController.swift
//  QuizApp
//
//  Created by Rafael Freitas on 10/03/21.
//

import UIKit

struct PresentableAnswer {
    var question: String
    var answer: String
    var isCorrect: Bool
}

class CorrectAnswerCell: UITableViewCell {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
}

class WrongAnswerCell: UITableViewCell {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var correctAnswerLabel: UILabel!
}

class ResultsViewController: UIViewController {
    //MARK: - variables
    private var summary = ""
    private var answers: [PresentableAnswer] = []
    
    //MARK: - UI
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    convenience init(summary: String, answers: [PresentableAnswer]) {
        self.init()
        
        self.summary = summary
        self.answers = answers
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        headerLabel.text = summary
        tableView.register(UINib(nibName: "CorrectAnswerCell", bundle: nil
        ), forCellReuseIdentifier: "CorrectAnswerCell")
        tableView.register(UINib(nibName: "WrongAnswerCell", bundle: nil
        ), forCellReuseIdentifier: "WrongAnswerCell")
    }
}

//MARK: - TableViewDelegate
extension ResultsViewController: UITableViewDelegate {
    
}

//MARK: - TableViewDataSource
extension ResultsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.answers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let answer = answers[indexPath.row]
        if answer.isCorrect {
            return correctAnswerCell(for: answer)
        } else {
            return wrongAnswerCell(for: answer)
        }
    }
    
    private func correctAnswerCell(for answer: PresentableAnswer) -> CorrectAnswerCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CorrectAnswerCell") as! CorrectAnswerCell
        cell.questionLabel.text = answer.question
        cell.answerLabel.text = answer.answer
        return cell
    }
    
    private func wrongAnswerCell(for answer: PresentableAnswer) -> WrongAnswerCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WrongAnswerCell") as! WrongAnswerCell
        cell.questionLabel.text = answer.question
        cell.correctAnswerLabel.text = answer.answer
        return cell
    }
}

