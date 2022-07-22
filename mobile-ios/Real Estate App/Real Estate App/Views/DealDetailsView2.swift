//
//  DealDetailsView2.swift
//  Real Estate App
//
//  Created by ManishaThete on 27/01/22.
//

import SwiftUI
import Combine

struct DealDetailsView2: View {
    
    @StateObject var detailVM = DealDetailsViewModel.shared
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        
        
        VStack{
            VStack {
                Text("Contact Details       --")
            }
            VStack {
                HStack{
                    Text("Deal Agent Name*")
                        .foregroundColor(.gray)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                }
                TextField("Enter here...", text: $detailVM.dealAgentName)
                    .padding()
                    .overlay()
            }
            .padding()
            
            
            
            VStack{
                HStack {
                    Text("Agency Owner Name")
                        .foregroundColor(.gray)
                    
                    
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                }
                
                TextField("Enter here...", text: $detailVM.agencyOwnerName)
                    .padding()
                    .overlay()
            }
            
            .padding()
            
            VStack{
                HStack{
                    
                    Text("Mobile Number of Deal Agent")
                        .foregroundColor(.gray)
                    
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                }
                
                TextField("XXX-XXX-XXXX", text:$detailVM.mobileNoDealAgent)
                    .padding()
                    .overlay()
                    .keyboardType(.numberPad)
                    .onReceive(Just(self.detailVM.mobileNoDealAgent)) { inputValue in
                        if inputValue.count > 10 {
                            self.detailVM.mobileNoDealAgent.removeLast()
                        }
                    }
                
            }
            .padding()
            
            VStack{
                HStack {
                    
                    Text("Agency Contact Number")
                        .foregroundColor(.gray)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    
                }
                TextField("XXX-XXX-XXXX", text: $detailVM.agencyContactNumber)
                    .padding()
                    .keyboardType(.numberPad)
                    .overlay()
                    .keyboardType(.numberPad)
                    .onReceive(Just(self.detailVM.agencyContactNumber)) { inputValue in
                        if inputValue.count > 10 {
                            self.detailVM.agencyContactNumber.removeLast()
                        }
                    }
            }
            .padding()
            
            NavigationLink(destination: DealDetailsView3()
                            .onAppear(perform: {
                detailVM.isDealDetailsPartTwoValid = false
            }),
                           isActive: self.$detailVM.isDealDetailsPartTwoValid)
            {
                Text("Next")
                    .padding()
                    .foregroundColor(.white)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .background(Color(Constants.Color.customDarkBlue))
                    .onTapGesture
                {
                    //Determine DealDetail Validity
                    
                    let isDealdetailValid = self.detailVM.isDealDetailsPartTwoComplete
                    
                    //Trigger Logic
                    if isDealdetailValid {
                        //Trigger NavigationLink
                        self.detailVM.isDealDetailsPartTwoValid = true
                        print(FileManager.default.urls(for: FileManager.SearchPathDirectory.documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask))

                    }
                    else {
                        self.detailVM.shouldShowDealDetailsAlert = true //trigger Alert
                    }
                    
                }
            }
            .padding([.leading, .trailing], 15)
            .alert(isPresented: $detailVM.shouldShowDealDetailsAlert) {
                Alert(title: Text("Deal Agent Name is Mandatory"))
                
            }
            
            Spacer()
        }
        
        
    }
}


struct DealDetailsView2_Previews: PreviewProvider {
    static var previews: some View {
        DealDetailsView2()
    }
}

