//
//  User+CoreDataProperties.swift
//  Real Estate App
//
//  Created by arifashraf on 02/02/22.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var agencyAddress: String?
    @NSManaged public var agencyName: String?
    @NSManaged public var businessLocation: String?
    @NSManaged public var businessType: String?
    @NSManaged public var city: String?
    @NSManaged public var contactMe: String?
    @NSManaged public var contactPersonEmail: String?
    @NSManaged public var contactPersonFirstName: String?
    @NSManaged public var contactPersonLastName: String?
    @NSManaged public var dealingStates: String?
    @NSManaged public var dealsType: String?
    @NSManaged public var email: String?
    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var numberOfEmployees: String?
    @NSManaged public var password: String?
    @NSManaged public var state: String?
    @NSManaged public var zipCode: String?
    @NSManaged public var deals: NSOrderedSet?

}

// MARK: Generated accessors for deals
extension User {

    @objc(insertObject:inDealsAtIndex:)
    @NSManaged public func insertIntoDeals(_ value: Deal, at idx: Int)

    @objc(removeObjectFromDealsAtIndex:)
    @NSManaged public func removeFromDeals(at idx: Int)

    @objc(insertDeals:atIndexes:)
    @NSManaged public func insertIntoDeals(_ values: [Deal], at indexes: NSIndexSet)

    @objc(removeDealsAtIndexes:)
    @NSManaged public func removeFromDeals(at indexes: NSIndexSet)

    @objc(replaceObjectInDealsAtIndex:withObject:)
    @NSManaged public func replaceDeals(at idx: Int, with value: Deal)

    @objc(replaceDealsAtIndexes:withDeals:)
    @NSManaged public func replaceDeals(at indexes: NSIndexSet, with values: [Deal])

    @objc(addDealsObject:)
    @NSManaged public func addToDeals(_ value: Deal)

    @objc(removeDealsObject:)
    @NSManaged public func removeFromDeals(_ value: Deal)

    @objc(addDeals:)
    @NSManaged public func addToDeals(_ values: NSOrderedSet)

    @objc(removeDeals:)
    @NSManaged public func removeFromDeals(_ values: NSOrderedSet)

}

extension User : Identifiable {

}
