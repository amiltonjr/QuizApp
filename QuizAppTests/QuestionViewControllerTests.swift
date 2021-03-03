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
    
    func test_viewDidLoad_withOneOption_rendersOneOptionText() {
        let sut = makeSUT(options: ["A1"])
        let cell = sut.tableView.cell()
        XCTAssertEqual(cell.textLabel?.text, "A1")
    }
    
    //MARK: - Helpers
    
    func makeSUT(question: String = "Q1", options: [String] = []) -> QuestionViewController {
        let sut = QuestionViewController(question: question, options: options)
        sut.loadViewIfNeeded()
        return sut
    }
}

fileprivate extension UITableView {
    func cell(row: Int = 0, section: Int = 0) -> UITableViewCell {
        self.dataSource?.tableView(self, cellForRowAt: IndexPath(row: row, section: section)) ?? UITableViewCell()
    }
}

