//
//  HomeView.swift
//  Real Estate App
//
//  Created by arifashraf on 14/12/21.
//

import SwiftUI

struct HomeView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack{
//        Text("Home View")
//            .navigationBarBackButtonHidden(true)
//            .toolbar {
//                Button(action: {
//                    dismiss()
//                }, label: {
//                    Text("Log Out")
//                })
//                
//            }
    
        NavigationLink(destination: DealDetailView(), label: {
            Text("CREATE NEW")
                
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
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .previewDevice("iPhone 11")
        
    }
}


