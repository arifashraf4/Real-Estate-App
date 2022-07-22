//
//  DealDetailsViewModel.swift
//  Real Estate App
//
//  Created by arifashraf on 28/12/21.
//
import SwiftUI
import CoreData

class DealDetailsViewModel: ObservableObject {
    
    static let shared = DealDetailsViewModel()
    private init() {
        
    }
    
    // DealDetail field property
    @Published var fileNumber: String = ""
    @Published var salesPrice: String = ""
    @Published var loanAmount: String  = ""
    @Published var financeInstitute: String = ""
    @Published var dealAgentName: String = ""
    @Published var agencyOwnerName: String = ""
    @Published var mobileNoDealAgent: String = ""
    @Published var agencyContactNumber: String = ""
    @Published var selectProperty: String = ""
    @Published var propertyType: String = ""
    @Published var propertyAddress: String = ""
    @Published var city: String = ""
    @Published var state: String = ""
    @Published var zipcode: String = ""
    @Published var country: String = ""
    @Published var municipality: String = ""
    @Published var subdivision: String = ""
    @Published var lot: String = ""
    @Published var parcel: String = ""
    @Published var selectedBookingDate: Date = Date()
    @Published var selectedDealClosingDate: Date = Date()
    
    // Toggle Switch Properties
    @Published var isCashOnlyToggle: Bool = true
    @Published var isCashAndFinanceToggle: Bool = false
    @Published var paymentType: String = "Cash Only"
    
    
    @Published var dealpropertyType: String = ""
    @Published var buyerFirstName: String = ""
    @Published var buyerMiddleName: String = ""
    @Published var buyerLastName: String = ""
    @Published var sellerFirstName: String = ""
    @Published var sellerMiddleName: String = ""
    @Published var sellerLastName: String = ""
    @Published var lenderName: String = ""
    @Published var loanNumber: String = ""
    
    //Picker Properties
    @Published var selectedState: String = "Select"
    @Published var selectedPropertyAddress: String = "Select"
    @Published var selectedBuyerType: String = "Select"
    @Published var selectedSellerType: String = "Select"
    @Published var selectedPropertyType: String = "Select"
    @Published var selectedTransactionType: String = "Select"
    
    //Image Properties
    @Published var propertyImage = UIImage()
    
    //Deal Details View Properties for Validation
    @Published var shouldShowDealDetailsAlert: Bool = false
    
    @Published var isDealDetailsPartOneValid: Bool = false
    @Published var isDealDetailsPartTwoValid: Bool = false
    @Published var isDealDetailsPartThreeValid: Bool = false
    @Published var isDealDetailsPartFourValid: Bool = false
    
    
    
    func clear(){
        
        fileNumber = ""
        selectedPropertyType = "Select"
        selectedTransactionType = "Select"
        salesPrice = ""
        loanAmount = ""
        selectedBookingDate = Date.now
        selectedDealClosingDate = Date.now
        financeInstitute = ""
        dealAgentName = ""
        agencyOwnerName = ""
        mobileNoDealAgent = ""
        agencyContactNumber = ""
        selectedPropertyAddress = "Select"
        propertyAddress = ""
        city = ""
        selectedState = "Select"
        zipcode = ""
        country = ""
        municipality = ""
        subdivision = ""
        lot = ""
        parcel = ""
        propertyImage = UIImage()
        selectedBuyerType = "Select"
        buyerFirstName = ""
        buyerMiddleName = ""
        buyerLastName = ""
        selectedSellerType = "Select"
        sellerFirstName = ""
        sellerMiddleName = ""
        sellerLastName = ""
        lenderName = ""
        loanNumber = ""
    }
    
    var isDealDetailsPartOneComplete: Bool {
        dealDetailsView1Validation(fileNumber: self.fileNumber, propertyType: self.selectedPropertyType, transactionType: self.selectedTransactionType)
    }
    
    var isDealDetailsPartTwoComplete: Bool {
        dealDetailsView2Validation(dealAgentName: self.dealAgentName)
    }
    
    var isDealDetailsPartThreeComplete: Bool {
        dealDetailsView3Validation(propertyAddress: self.propertyAddress)
    }
    
    var isDealDetailsPartFourComplete: Bool {
        dealDetailsView4Validation(loanNumber: self.loanNumber)
    }
    
    func dealDetailsView1Validation(fileNumber: String, propertyType: String, transactionType: String) -> Bool {
        if fileNumber.isEmpty || propertyType == "Select" || propertyType.isEmpty || transactionType == "Select" || transactionType.isEmpty {
            return false
        } else {
            return true
        }
    }
    
    func dealDetailsView2Validation(dealAgentName: String) -> Bool {
        if dealAgentName.isEmpty {
            return false
        } else {
            return true
        }
    }
    
    func dealDetailsView3Validation(propertyAddress: String) -> Bool {
        if propertyAddress.isEmpty {
            return false
        } else {
            return true
        }
    }
    
    func dealDetailsView4Validation(loanNumber: String) -> Bool {
        if loanNumber.isEmpty {
            return false
        } else {
            return true
        }
    }
    
    var states1: [String] = ["Select",
                             "Andaman and Nicobar Island",
                             "Andhra Pradesh",
                             "Arunachal Pradesh",
                             "Assam",
                             "Bihar",
                             "Chandigarh",
                             "Chhattisgarh",
                             "Delhi",
                             "Goa",
                             "Gujarat",
                             "Haryana",
                             "Himachal Pradesh",
                             "Jammu and Kashmir",
                             "Jharkhand",
                             "Karnataka",
                             "Kerala",
                             "Ladakh",
                             "Lakshadweep",
                             "Madhya Pradesh",
                             "Maharashtra",
                             "Manipur",
                             "Meghalaya",
                             "Mizoram",
                             "Nagaland",
                             "Odisha",
                             "Puducherry",
                             "Punjab",
                             "Rajasthan",
                             "Sikkim",
                             "Tamil Nadu",
                             "Telangana",
                             "Tripura",
                             "Uttarakhand",
                             "Uttar Pradesh",
                             "West Bengal"
    ]
    
    let selectProperty1 = ["Select",
                           "Palace",
                           "Home",
                           "Jolly Apartment",
                           "Peace Apartment"
    ]
    
    
    let propertyType1 = ["Select",
                         "Flat",
                         "Plot",
                         "Office"
    ]
    
    let transactionType = ["Select",
                           "Sale",
                           "Rent",
                           "Purchase"
    ]
    
    let sellerType = ["Select",
                      "Individual",
                      "Organization"
    ]
    
    
    let buyerType = ["Select",
                     "Individual",
                     "Organization"
    ]
    
    func saveDeals() {
        
        let deal = Deal(context: CoreDataManager.shared.viewContext)
        
        deal.fileNumber = fileNumber
        deal.agencyContactNumber = agencyContactNumber
        deal.agencyOwnerName = agencyOwnerName
        deal.bookingDate = selectedBookingDate
        deal.buyerFirstName = buyerFirstName
        deal.buyerLastName = buyerLastName
        deal.buyerMiddleName = buyerMiddleName
        deal.buyerType = selectedBuyerType
        deal.dealAgentMobileNumber = mobileNoDealAgent
        deal.dealAgentName = dealAgentName
        deal.dealClosingDate = selectedDealClosingDate
        deal.financeInstitute = financeInstitute
        deal.lenderLoanNumber = loanNumber
        deal.lenderName = lenderName
        deal.loanAmount = loanAmount
        deal.propertyAddress = propertyAddress
        deal.propertyCity = city
        deal.propertyCountry = country
        deal.propertyLot = lot
        deal.propertyMunicipality = municipality
        deal.propertyParcelID = parcel
        deal.propertyState = selectedState
        deal.propertySubdivision = subdivision
        deal.propertyType = selectedPropertyType
        deal.propertyZipCode = zipcode
        deal.salesPrice = salesPrice
        deal.selectProperty = selectedPropertyAddress
        deal.sellerFirstName = sellerFirstName
        deal.sellerLastName = sellerLastName
        deal.sellerMiddleName = sellerMiddleName
        deal.sellerType = selectedSellerType
        deal.transactionType = selectedTransactionType
        deal.contactPersonEmail = LoggedInUser.shared.currentUser?.contactPersonEmail
        deal.cashOnly = isCashOnlyToggle
        deal.cashAndFinance = isCashAndFinanceToggle
        
        let pickedImage = propertyImage.pngData()
        deal.propertyImage = pickedImage
        
        LoggedInUser.shared.currentUser?.addToDeals(deal)
        
        CoreDataManager.shared.save()
    }
}
