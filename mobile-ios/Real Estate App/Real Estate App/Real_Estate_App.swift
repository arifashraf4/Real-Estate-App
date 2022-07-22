//
//  Real_Estate_AppApp.swift
//  Real Estate App
//
//  Created by arifashraf on 08/12/21.
//

import SwiftUI

@main
struct Real_Estate_App: App {
    var body: some Scene {
        WindowGroup {
            if (UserDefaults.standard.value(forKey: "isUserLoggedIn") != nil) == true
                && LoginViewModel().fetch(email: UserDefaults.standard.string(forKey: "email") ?? "" , password: UserDefaults.standard.string(forKey: "password") ?? "")
            {
                NavigationView {
                    TabBarView()
                }.accentColor(Color(Constants.Color.customDarkBlue))
            } else {
                LoginView()
            }
        }
    }
}
