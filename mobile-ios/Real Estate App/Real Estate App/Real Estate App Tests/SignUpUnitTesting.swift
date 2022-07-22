//
//  signUpUnittesting.swift
//  Real Estate AppTests
//
//  Created by ManishaThete on 18/02/22.
//

import XCTest
@testable import Real_Estate_App

class SignUpUnitTesting: XCTestCase {
    var signUpViewModel = SignUpViewModel.shared
    
    //MARK: SignUp Unit Tests
    
    func testEmailIsValidInSignUp() {
        XCTAssertTrue(signUpViewModel.isEmailValid(email: "asd@123.com"))
    }
    
    func testPasswordIsValidInSignUp() {
        XCTAssertTrue(signUpViewModel.isPasswordValid(password: "12345678"))
    }
    
    func testZipCodeValid() {
        XCTAssertTrue(signUpViewModel.validateZipCode(zipCode: "123456"))
    }
       

}
