//
//  DealDetailViewModel.swift
//  Real Estate App
//
//  Created by ManishaThete on 28/12/21.
//

import SwiftUI
import Foundation

class  DealDetailViewModel : ObservableObject {
    // DealDetail  field property
    @Published var filename : String = ""
    @Published var propertytype : String = ""
    @Published var transactiontype : String = ""
    @Published var cashonly : String = ""
    @Published var cashfinance : String = ""
    @Published var salesprice : String = ""
    @Published var loanamount : String  = ""
    @Published var bookingdate : String = ""
    @Published var dealclosingdate : String = ""
    @Published var financeinstitute : String = ""
    @Published var dealagentname : String = ""
    @Published var agencyownername : String = ""
    @Published var mobilenodealagent : String = ""
    @Published var agencycontactnumber : String = ""
    @Published var selectproperty : String = ""
    @Published var propertyaddress : String = ""
    @Published var city : String = ""
    @Published var state : String = ""
    @Published var zipcode : String = ""
    @Published var country : String = ""
    @Published var municipality : String = ""
    @Published var subdivision : String = ""
    @Published var lot: String = ""
    @Published var parcel : String = ""
    @Published var isToggle : Bool = false
    @Published var isToggle1 : Bool = true
    @Published var buyerfirstname : String = ""
    @Published var buyermiddlename : String = ""
    @Published var buyerlastname : String = ""
    @Published var sellerfirstname : String = ""
    @Published var sellermiddlename : String = ""
    @Published var sellerlastname : String = ""
    @Published var lenderename : String = ""
    @Published var loannumber : String = ""
    
    // picker Logic
    @Published var selectedbuyer: String = "Select"
    @Published var selectedseller: String = "Select"
    

let sellertype = ["Select",
                  "Individual",
                  "Organization"
]


let buyertype = ["Select",
                 "Individual",
                 "Organization"
]

}
