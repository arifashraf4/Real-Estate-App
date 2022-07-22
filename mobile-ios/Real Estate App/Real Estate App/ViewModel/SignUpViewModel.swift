//
//  SignUpViewModel.swift
//  Real Estate App
//
//  Created by arifashraf on 16/12/21.
//
import SwiftUI
import CoreData

class SignUpViewModel: ObservableObject {
    
    static let shared = SignUpViewModel()
    private init() {
        
    }
    
    //SignUp Field Properties
    @Published var agencyName: String = ""
    @Published var agencyAddress: String = ""
    @Published var city: String = ""
    @Published var zipCode: String = ""
    @Published var numberOfEmployees: String = "NA"
    @Published var firstName: String = "NA"
    @Published var lastName: String = "NA"
    @Published var email: String = "NA"
    @Published var isSignUpPartOneValid: Bool = false
    @Published var isSignUpPartTwoValid: Bool = false
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
    @Published var selectedBusinessLocation: String = "Select"
    
    //Sign Up Validation
    
    func isEmailValid(email: String) -> Bool {
        let emailTest = NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
        return emailTest.evaluate(with: email)
    }
    
    func isPasswordValid(password: String) -> Bool {
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", ".{8,}")
        return passwordTest.evaluate(with: password)
    }
    
    func clear(){
        isSignUpPartOneValid = false
        isSignUpPartTwoValid = false
        
        agencyAddress = ""
        agencyName = ""
        selectedBusinessLocation = "Select"
        selectedBusinessType = "Select"
        city = ""
        selectedContactMe = "Select"
        contactPersonEmail = ""
        contactPersonFirstName = ""
        contactPersonLastName = ""
        selectedDealingState = "Select"
        selectedDealsType = "Select"
        firstName = ""
        lastName = ""
        numberOfEmployees = ""
        password = ""
        confirmPassword = ""
        selectedState = "Select"
        zipCode = ""
        
    }
    
    var isSignUpDetailsPartOneComplete: Bool {
        if self.agencyName.isEmpty || self.agencyAddress.isEmpty || self.city.isEmpty || self.selectedState.isEmpty || self.zipCode.isEmpty || self.selectedBusinessType.isEmpty || self.selectedDealsType.isEmpty || selectedBusinessType == "Select" || selectedState == "Select" || selectedDealsType == "Select" {
            return false
        }
        return true
    }
    
    var isSignUpDetailsPartTwoComplete: Bool {
        if !isEmailValid(email: self.contactPersonEmail) || !isPasswordValid(password: password) || contactPersonFirstName.isEmpty || contactPersonLastName.isEmpty || contactPersonEmail.isEmpty || self.password.isEmpty || self.confirmPassword.isEmpty || self.password != self.confirmPassword {
            return false
        }
        return true
    }
    
    func validateZipCode(zipCode: String) -> Bool {
        if zipCode.count < 6 {
            return false
        } else {
            return true
        }
    }
    
    //MARK: Validation Prompt
    //    var emailPrompt: String {
    //        if isEmailValid() {
    //            return ""
    //        } else {
    //            return "Enter a valid email address"
    //        }
    //    }
    //
    var emailExistOrNotPrompt: String {
        if !fetch(email: contactPersonEmail) {
            return ""
        } else {
            return "\(contactPersonEmail) already exists."
        }
    }
    
    var passwordPrompt: String {
        if isPasswordValid(password: password) {
            return ""
        } else {
            return "Password should be 8 characters long"
        }
    }
    
    var confirmPasswordPrompt: String {
        if confirmPassword == password {
            return ""
        } else {
            return "Password does not match"
        }
        
    }
    
    //MARK: Picker View Properties
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
        
        user.contactPersonEmail = contactPersonEmail
        user.password = password
        user.agencyName = agencyName
        user.agencyAddress = agencyAddress
        user.city = city
        user.state = selectedState
        user.zipCode = zipCode
        user.businessType = selectedBusinessType
        user.dealsType = selectedDealsType
        user.businessLocation = selectedBusinessLocation
        user.dealingStates = selectedDealingState
        user.numberOfEmployees = numberOfEmployees
        user.firstName = firstName
        user.lastName = lastName
        user.email = email
        user.contactMe = selectedContactMe
        user.contactPersonFirstName = contactPersonFirstName
        user.contactPersonLastName = contactPersonLastName
        
        
        
        CoreDataManager.shared.save()
        
        let fetchRequest = LoggedInUser.shared.fetchUser
        let users = try? CoreDataManager.shared.viewContext.fetch(fetchRequest)
        LoggedInUser.shared.currentUser = users?.last
        
        if users == [] {
            print("No data")
        } else {
            print("Data available")
            print(users as Any)
        }
    }
    
    func fetch(email: String) -> Bool {
        let fetchRequest = User.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "contactPersonEmail =%@", email)
        let users = try? CoreDataManager.shared.viewContext.fetch(fetchRequest)
        
        LoggedInUser.shared.currentUser = users?.first
        
        if users == [] {
            print("No data")
            return false
        } else {
            print("Data available")
            print(users as Any)
            return true
        }
    }
    
}
