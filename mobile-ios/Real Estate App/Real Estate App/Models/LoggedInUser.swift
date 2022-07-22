//
//  LoggedInUser.swift
//  Real Estate App
//
//  Created by arifashraf on 31/12/21.
//

import Foundation
import CoreData

class LoggedInUser {
    
    static let shared = LoggedInUser()
    
    var currentUser: User?
    var fetchUser = User.fetchRequest()
    
    var currentDeal: Deal?
    var fetchDeal = Deal.fetchRequest()
    
}
