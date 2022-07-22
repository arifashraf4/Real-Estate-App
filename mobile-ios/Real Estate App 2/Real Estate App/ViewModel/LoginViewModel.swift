//
//  LoginViewModel.swift
//  Real Estate App
//
//  Created by arifashraf on 09/12/21.
import SwiftUI

class LoginViewModel: ObservableObject {
    
    //Login Field Properties
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isLoginValid: Bool = false
    @Published var shouldShowLoginAlert: Bool = false
    
    //Remember Me Checkbox Properties
    @Published var checkState: Bool = false
    @Published var savedUsername = ""
    @Published var savedPassword = ""
    
    //MARK: Login Validation
    func isEmailValid() -> Bool {
        let emailTest = NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
        return emailTest.evaluate(with: email)
    }
    
    func isPasswordValid() -> Bool {
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", ".{8,}")
        return passwordTest.evaluate(with: password)
    }
    
    var isLoginComplete: Bool {
        if !isEmailValid() ||
            !isPasswordValid() {
            return false
        }
        return true
    }
    
    //Perform Signup functions then clear fields
    func clearTextFields() {
        email = ""
        password = ""
    }
    
    //MARK: Remember Me Functions
    func saveData() {
        if checkState{
            UserDefaults.standard.set(email, forKey: "email")
            UserDefaults.standard.set(password, forKey: "password")
            print("Saved Data")
            print("Email: \(email) Password: \(password)")
        } else {
            print("Couldnt save")
        }
    }
    
    func getData(){
        savedUsername = UserDefaults.standard.string(forKey: "email") ?? ""
        savedPassword = UserDefaults.standard.string(forKey: "password") ?? ""
        
        email = savedUsername
        password = savedPassword
        
        print("Get Data: \(email) \(password)")
    }
    
    //MARK: Validation Prompt
    var emailPrompt: String {
        if isEmailValid() {
            return ""
        } else {
            return "Enter a valid email address"
        }
    }

    var passwordPrompt: String {
        if isPasswordValid() {
            return ""
        } else {
            return ""
        }
    }
}
