//
//  LoginViewModel.swift
//  Real Estate App
//  Created by arifashraf on 09/12/21.
import SwiftUI

class LoginViewModel: ObservableObject {
    
    //Login Field Properties
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isLoginValid: Bool = false
    @Published var shouldShowLoginAlert: Bool = false
    
    //Remember Me Checkbox Properties
    //    @Published var checkState: Bool = false
    //    @Published var savedUsername = ""
    //    @Published var savedPassword = ""
    
    //Keeping User Logged In Property
    @Published var isUserLoggedIn: Bool = false
    
    //MARK: Login Validation
    func isEmailValid(email: String) -> Bool {
        let emailTest = NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
        return emailTest.evaluate(with: email)
    }
    
    func isPasswordValid(password: String) -> Bool {
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", ".{8,}")
        return passwordTest.evaluate(with: password)
    }
    
    var isLoginComplete: Bool {
        if !fetch(email: self.email, password: self.password) {
            return false
        } else {
            return true
        }
    }
    
    //Perform Signup functions then clear fields
    //    func clearTextFields() {
    //        email = ""
    //        password = ""
    //    }
    
    //MARK: Remember Me Functions
    func saveData() {
        if isLoginComplete {
            isUserLoggedIn = true
            UserDefaults.standard.set(email, forKey: "email")
            UserDefaults.standard.set(password, forKey: "password")
            UserDefaults.standard.set(isUserLoggedIn, forKey: "isUserLoggedIn")
            print("Saved Data")
            print("Email: \(email) Password: \(password) Logged In: \(isUserLoggedIn)")
        } else {
            isUserLoggedIn = false
            UserDefaults.standard.set("", forKey: "email")
            UserDefaults.standard.set("", forKey: "password")
            print("Couldnt save")
        }
    }
    
    //    func getData(){
    //        savedUsername = UserDefaults.standard.string(forKey: "email") ?? ""
    //        savedPassword = UserDefaults.standard.string(forKey: "password") ?? ""
    //
    //        email = savedUsername
    //        password = savedPassword
    //
    //        print("Get Data: \(email) \(password) \(isUserLoggedIn)")
    //    }
    
    func fetch(email: String, password: String) -> Bool {
        let fetchRequest = User.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "contactPersonEmail =%@ AND password =%@", email, password)
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
    
    func saveDemoCred() {
        let user = User(context: CoreDataManager.shared.viewContext)
        
        user.contactPersonEmail = "test@test.com"
        user.password = "12345678"
        
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
    
}
