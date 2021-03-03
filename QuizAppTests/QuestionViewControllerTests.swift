//
//  QuestionViewControllerTests.swift
//  QuizAppTests
//
//  Created by Rafael Freitas on 02/03/21.
//

import XCTest
@testable import QuizApp

class QuestionViewControllerTests: XCTestCase {
    func test_viewController_rendersQuestionHeaderText() {
        let sut = makeSUT(question: "Q1")
        XCTAssertEqual(sut.headerLabel.text, "Q1")
    }
    
    func test_viewDidLoad_rendersOption() {
        XCTAssertEqual(makeSUT(options: []).tableView.numberOfRows(inSection: 0), 0)
        XCTAssertEqual(makeSUT(options: ["A1"]).tableView.numberOfRows(inSection: 0), 1)
        XCTAssertEqual(makeSUT(options: ["A1", "A2"]).tableView.numberOfRows(inSection: 0), 2)
    }
    
    func test_viewDidLoad_rendersOptionsText() {
        XCTAssertEqual(makeSUT(options: ["A1"]).tableView.title(), "A1")
        XCTAssertEqual(makeSUT(options: ["A1", "A2"]).tableView.title(at: 1), "A2")
        XCTAssertEqual(makeSUT(options: ["A1", "A2", "A3"]).tableView.title(at: 2), "A3")
    }
    
    func test_optionSelected_withTwoOptions_notifiesDelegateWithLastSelection() {
        var receivedAnswer = ""
        
        let sut = makeSUT(options: ["A1", "A2"]) {
            receivedAnswer = $0
        }
        
        sut.tableView.select()
        XCTAssertEqual(receivedAnswer, "A1")
        sut.tableView.select(row: 1)
        XCTAssertEqual(receivedAnswer, "A2")
    }
    
    //MARK: - Helpers
    
    func makeSUT(
        question: String = "Q1",
        options: [String] = [],
        selection: @escaping (String) -> Void = { _ in }
    ) -> QuestionViewController {
        let sut = QuestionViewController(question: question, options: options, selection: selection)
        sut.loadViewIfNeeded()
        
        return sut
    }
}

fileprivate extension UITableView {
    func cell(row: Int = 0, section: Int = 0) -> UITableViewCell {
        self.dataSource?.tableView(self, cellForRowAt: IndexPath(row: row, section: section)) ?? UITableViewCell()
    }
    
    func title(at row: Int = 0) -> String? {
        cell(row: row).textLabel?.text
    }
    
    func select(row: Int = 0) {
        delegate?.tableView?(self, didSelectRowAt: IndexPath(row:row, section: 0))
    }
}

