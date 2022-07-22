//
//  ExistingDealDetailsViewModel.swift
//  Real Estate App
//
//  Created by arifashraf on 10/01/22.
//

import SwiftUI
import CoreData

class ExistingDealDetailsViewModel: ObservableObject {
    
    @Published var toggle: Bool = false
    
    func update(){
        CoreDataManager.shared.save()
    }
    
}
