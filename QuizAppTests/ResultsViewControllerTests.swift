//
//  ResultsViewControllerTests.swift
//  QuizAppTests
//
//  Created by Rafael Freitas on 10/03/21.
//

import XCTest
@testable import QuizApp

class ResultsViewControllerTests: XCTestCase {

    func test_viewDidLoad_RenderSummary() {
        XCTAssertEqual(makeSUT(summary: "a summary").headerLabel.text, "a summary")
    }
    
    func test_viewDidLoad_withoutAnswer_doesNotRenderAnswers() {
        XCTAssertEqual(makeSUT(answers:[]).tableView.numberOfRows(inSection: 0), 0)
    }
    
    func test_viewDidLoad_withOneAnswer_rendersAnswer() {
        XCTAssertEqual(makeSUT(answers: [makeDummyAnswer()]).tableView.numberOfRows(inSection: 0), 1)
    }
    
    func test_viewDidLoad_withCorrectAnswer_rendersCorrectAnswerCell() {
        let sut = makeSUT(answers: [makeAnswer(question: "Q1", isCorrect: true)])
        let cell = sut.tableView.cell(row: 0) as? CorrectAnswerCell
        XCTAssertNotNil(cell)
    }
    
    func test_viewDidLoad_withCorrectAnswer_rendersQuestionAndAnswerText() {
        let answer = makeAnswer(question: "Q1", answer: "A1", isCorrect: true)
        let sut = makeSUT(answers: [answer])
        let cell = sut.tableView.cell(row: 0) as? CorrectAnswerCell
        XCTAssertNotNil(cell)
        XCTAssertEqual(cell?.questionLabel.text, "Q1")
        XCTAssertEqual(cell?.answerLabel.text, "A1")
    }
        
    func test_viewDidLoad_withWrongAnswer_rendersWrongAnswerCell() {
        let sut = makeSUT(answers: [makeAnswer(isCorrect: false)])
        let cell = sut.tableView.cell(row: 0) as? WrongAnswerCell
        XCTAssertNotNil(cell)
    }
    
    func test_viewDidLoad_withWroongAnswer_rendersQuestionAndAnswerText() {
        let answer = makeAnswer(question: "Q1", answer: "A1", isCorrect: false)
        let sut = makeSUT(answers: [answer])
        let cell = sut.tableView.cell(row: 0) as? WrongAnswerCell
        XCTAssertNotNil(cell)
        XCTAssertEqual(cell?.questionLabel.text, "Q1")
        XCTAssertEqual(cell?.answerLabel.text, "A1")
    }
    
    //MARK: - Helpers
    
    func makeSUT(summary: String = "A Summmary", answers: [PresentableAnswer] = []) -> ResultsViewController {
        let sut = ResultsViewController(summary: summary, answers: answers)
        _ = sut.view
        sut.loadViewIfNeeded()
        return sut
    }
    
    func makeAnswer(question: String = "", answer: String = "", isCorrect: Bool) -> PresentableAnswer {
        PresentableAnswer(question: question, answer: answer, isCorrect: isCorrect)
    }
    
    func makeDummyAnswer() -> PresentableAnswer {
        return PresentableAnswer(question: "", answer: "", isCorrect: false)
    }

}
