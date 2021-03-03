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
        let sut = QuestionViewController(question: "Q1", options: [])
        sut.loadViewIfNeeded()
        XCTAssertEqual(sut.headerLabel.text, "Q1")
    }
    
    func test_viewDidLoad_withNoOptions_rendersZeroOptions() {
        let sut = QuestionViewController(question: "Q1", options: []);
        sut.loadViewIfNeeded()
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 0)
    }
    
    func test_viewDidLoad_withOneOption_rendersOneOption() {
        let sut = QuestionViewController(question: "Q1", options: ["A1"]);
        sut.loadViewIfNeeded()
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 1)
    }
    
    func test_viewDidLoad_withOneOption_rendersOneOptionText() {
        let sut = QuestionViewController(question: "Q1", options: ["A1"]);
        sut.loadViewIfNeeded()
        let cell = sut.tableView.dataSource?.tableView(sut.tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        XCTAssertEqual(cell?.textLabel?.text, "A1")
    }
}

