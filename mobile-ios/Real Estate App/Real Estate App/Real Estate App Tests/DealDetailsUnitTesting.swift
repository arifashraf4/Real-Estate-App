//
//  DealDetailsUnitTesting.swift
//  Real Estate AppTests
//
//  Created by ManishaThete on 18/02/22.
//

import XCTest
@testable import Real_Estate_App

class DealDetailsUnitTesting: XCTestCase {
    
    var dealDetailsVM = DealDetailsViewModel.shared
   
    //MARK: Deal Details Unit Tests
    
    func testDealDetailsView1MandatoryFieldsFilled(){
        XCTAssertTrue(dealDetailsVM.dealDetailsView1Validation(fileNumber: "1", propertyType: "Flat", transactionType: "Rent"))
    }
    
    func testDealDetailsView2MandatoryFieldsFilled(){
        XCTAssertTrue(dealDetailsVM.dealDetailsView2Validation(dealAgentName: "Tarun"))
    }
    
    func testDealDetailsView3MandatoryFieldsFilled(){
        XCTAssertTrue(dealDetailsVM.dealDetailsView3Validation(propertyAddress: "Crystal Park, IT"))
    }
    
    func testDealDetailsView4MandatoryFieldsFilled(){
        XCTAssertTrue(dealDetailsVM.dealDetailsView4Validation(loanNumber: "12345"))
    }
    
}
