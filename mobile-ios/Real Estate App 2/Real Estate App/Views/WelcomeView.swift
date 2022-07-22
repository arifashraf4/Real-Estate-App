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
            Text("Congratulations! Your Registration is complete")
                .padding(.top, 400)
            
            Spacer(minLength: 50)
            
            NavigationLink(destination: HomeView(), label: {
                Text("Close")
                    
            })
                .foregroundColor(.white)
                .padding()
                .frame(minWidth: 0, maxWidth: .infinity)
                .background(Color("CustomDarkBlue"))
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
