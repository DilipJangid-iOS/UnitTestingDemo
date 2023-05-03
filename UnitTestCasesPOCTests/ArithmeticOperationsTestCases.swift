//
//  ArithmeticOperationsTestCases.swift
//  UnitTestCasesPOCTests
//
//  Created by Dilip Jangid on 24/04/23.
//

import XCTest
@testable import UnitTestCasesPOC

final class ArithmeticOperationsTestCases: XCTestCase {
    var sut: ArithmeticOperationsViewModel?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = ArithmeticOperationsViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }

    // Positive
    func testAddition() throws {
        // Given
        // Required
        // Then
        let total = 7
        let result = sut?.addition(num1: 4, num2: 3)
        XCTAssertEqual(total, result)
    }
    
    func testAdditionNegative() throws {
        // Given
        // Required
        // Then
        let total = 8
        let result = sut?.addition(num1: 4, num2: 3)
        XCTAssertNotEqual(total, result)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testValidateStringPositive() {
        XCTAssertNoThrow(try sut?.validateString(text: "This is a valid string"), "Valid string")
    }
    
    func testValidateStringNegative() {
        XCTAssertThrowsError(try sut?.validateString(text: ""), "Empty String") { error in
            XCTAssertEqual(StringError.EmptyStringError, error as? StringError)
        }
    }
    
    func testFetchUsers() async throws {
        let user = try await sut?.fetchUsers()
        XCTAssertTrue(user?.count ?? 0 > 0 )
    }
}
