//
//  WelcomeView.swift
//  Real Estate App
//
//  Created by arifashraf on 15/12/21.
//

import SwiftUI

struct WelcomeView: View {
    
    var body: some View {
        
        VStack {
            
            Image("WelcomeLogo")
                .padding(.top, 200)
            
            Text("Congratulations! Your Registration is complete")
                .padding([.top,.bottom])
            
            Text("Contact Us")
                .padding()
            
            HStack {
                
                Image(systemName: "phone")
                Text("800-034-2525")
                    .foregroundColor(Color(Constants.Color.customDarkBlue))
                
            }
            .padding()
            
            HStack {
                
                Image(systemName: "envelope")
                Text("support@unicornc.com")
                    .foregroundColor(Color(Constants.Color.customDarkBlue))
                
            }
            .padding()
            
            Spacer(minLength: 50)
            
            NavigationLink(destination: LoginView()
                            .onAppear(perform: {
                UserDefaults.standard.set("", forKey: "email")
                UserDefaults.standard.set("", forKey: "password")
            })
                            .navigationBarHidden(true), label: {
                
                Text("Close")
                
            })
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding()
                .border(.gray, width: 1)
                .foregroundColor(Color(Constants.Color.customDarkBlue))
                .background(.white)
                .navigationBarBackButtonHidden(true)
            
        }
        .padding()
        
    }
    
}

struct WelcomeView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        WelcomeView()
        
    }
    
}
