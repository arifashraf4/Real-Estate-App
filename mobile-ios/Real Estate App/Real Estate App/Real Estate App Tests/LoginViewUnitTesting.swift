//
//  Real_Estate_AppTests.swift
//  Real Estate AppTests
//
//  Created by ManishaThete on 20/01/22.
//

import XCTest
@testable import Real_Estate_App


class LoginViewUnitTesting: XCTestCase {
    
    var loginViewModel: LoginViewModel!
    
    override func setUp() {
        loginViewModel = .init()
    }
    
    //MARK: Login Unit Tests
    
    func testEmailIsValidInLogin() {
        XCTAssertTrue(loginViewModel.isEmailValid(email: "asd@123.com"))
    }
    
    func testPasswordIsValidInLogin() {
        XCTAssertTrue(loginViewModel.isPasswordValid(password: "12345678"))
    }
    
    func testEmailAndPasswordExistInDatabase() {
        XCTAssertTrue(loginViewModel.fetch(email: "asd@gmail.com", password: "12345678"))
    }

}
