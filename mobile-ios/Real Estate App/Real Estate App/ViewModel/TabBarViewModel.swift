//
//  TabBarViewModel.swift
//  Real Estate App
//
//  Created by arifashraf on 06/01/22.
//

import Foundation
import SwiftUI

class TabBarViewModel: ObservableObject {
    
    @Environment(\.dismiss) var dismiss
    @Published var selectedTab: Tabs = .home
    
    enum Tabs: String {
        case home
        case dealDetailsForm = "Deal Details Form"
        case mapview = "Map View"
    }
    
}
