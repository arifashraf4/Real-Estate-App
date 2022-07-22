//
//  Deal+CoreDataProperties.swift
//  Real Estate App
//
//  Created by arifashraf on 02/02/22.
//
//

import Foundation
import CoreData


extension Deal {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Deal> {
        return NSFetchRequest<Deal>(entityName: "Deal")
    }

    @NSManaged public var agencyContactNumber: String
    @NSManaged public var agencyOwnerName: String
    @NSManaged public var bookingDate: Date
    @NSManaged public var buyerFirstName: String
    @NSManaged public var buyerLastName: String
    @NSManaged public var buyerMiddleName: String
    @NSManaged public var buyerType: String
    @NSManaged public var contactPersonEmail: String?
    @NSManaged public var dealAgentMobileNumber: String
    @NSManaged public var dealAgentName: String
    @NSManaged public var dealClosingDate: Date
    @NSManaged public var fileNumber: String
    @NSManaged public var financeInstitute: String
    @NSManaged public var lenderLoanNumber: String
    @NSManaged public var lenderName: String
    @NSManaged public var loanAmount: String
    @NSManaged public var propertyAddress: String
    @NSManaged public var propertyCity: String
    @NSManaged public var propertyCountry: String
    @NSManaged public var propertyImage: Data?
    @NSManaged public var propertyLot: String
    @NSManaged public var propertyMunicipality: String
    @NSManaged public var propertyParcelID: String
    @NSManaged public var propertyState: String
    @NSManaged public var propertySubdivision: String
    @NSManaged public var propertyType: String
    @NSManaged public var propertyZipCode: String
    @NSManaged public var salesPrice: String
    @NSManaged public var selectProperty: String
    @NSManaged public var sellerFirstName: String
    @NSManaged public var sellerLastName: String
    @NSManaged public var sellerMiddleName: String
    @NSManaged public var sellerType: String
    @NSManaged public var transactionType: String
    @NSManaged public var cashOnly: Bool
    @NSManaged public var cashAndFinance: Bool
    @NSManaged public var user: User?

}

extension Deal : Identifiable {

}
