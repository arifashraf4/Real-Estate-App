//
//  SignUpViewModel.swift
//  Real Estate App
//
//  Created by arifashraf on 16/12/21.
//
import SwiftUI
import CoreData

class SignUpViewModel: ObservableObject {
    
    //SignUp Field Properties
    @Published var agencyName: String = ""
    @Published var agencyAddress: String = ""
    @Published var city: String = ""
    @Published var zipCode: String = ""
    @Published var numberOfEmployees: String = ""
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var email: String = ""
    @Published var isSignUpValid: Bool = false
    @Published var shouldShowSignUpAlert: Bool = false
    @Published var contactPersonFirstName: String = ""
    @Published var contactPersonLastName: String = ""
    @Published var contactPersonEmail: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    //Picker Logic
    @Published var selectedState: String = "Select"
    @Published var selectedContactMe: String = "Select"
    @Published var selectedBusinessType: String = "Select"
    @Published var selectedDealsType: String = "Select"
    @Published var selectedDealingState: String = "Select"
    @Published var selectedBusinessLocation: String = "String"
    
    //Sign Up Validation
    var isSignUpComplete: Bool {
        if self.agencyName.isEmpty || self.agencyAddress.isEmpty || self.city.isEmpty || self.selectedState.isEmpty || self.zipCode.isEmpty || self.selectedBusinessType.isEmpty || self.selectedDealsType.isEmpty || self.selectedBusinessLocation.isEmpty || self.selectedDealingState.isEmpty || self.numberOfEmployees.isEmpty || self.firstName.isEmpty || self.lastName.isEmpty || self.email.isEmpty || self.selectedContactMe.isEmpty || self.contactPersonFirstName.isEmpty || self.contactPersonLastName.isEmpty || self.contactPersonEmail.isEmpty ||  self.password.isEmpty || self.confirmPassword.isEmpty || self.password != self.confirmPassword {
            return false
        }
        return true
    }
    
    
    
    let contactMe = ["Select",
                     "Yes",
                     "No"
    ]
    
    let businessType = ["Select",
                         "Buider",
                         "Property Broker"
    ]
    
    let dealsType = ["Select",
                     "Buy/Sell",
                     "Rent"
    ]
    
    let states: [String] = ["Select",
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
    
    let businessLocation: [String] = ["Select",
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
    
    let dealingStates: [String] = ["Select",
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
    
    func save() {
        
        let user = User(context: CoreDataManager.shared.viewContext)
        user.email = email
        user.password = password
        
        CoreDataManager.shared.save()
        
    }

    
}
