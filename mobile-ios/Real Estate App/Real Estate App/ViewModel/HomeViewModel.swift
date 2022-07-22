//
//  HomeViewModel.swift
//  Real Estate App
//
//  Created by arifashraf on 29/12/21.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var deals: [Deal] = []
    
    func fetch() {
        let fetchRequest = LoggedInUser.shared.fetchDeal
        guard let email = LoggedInUser.shared.currentUser?.contactPersonEmail else { return }
        let pred = NSPredicate(format: "contactPersonEmail =%@", email)
        fetchRequest.predicate = pred
        
        do {
            self.deals = try CoreDataManager.shared.viewContext.fetch(fetchRequest)
            print(deals as Any)
        } catch {
            self.deals = []
            print(deals as Any)
        }
    }
    
    init() {
        fetch()
    }
}
