//
//  DealDetailView4.swift
//  Real Estate App
//
//  Created by ManishaThete on 27/01/22.
//

import SwiftUI
import Combine
//import XCTest
struct DealDetailsView4: View {
    @StateObject var detailVM = DealDetailsViewModel.shared
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView{
            VStack{
                
                HStack{
                    Text("Buyer Details   -")
                        .padding()
                }
                
                VStack{
                    HStack{
                        Text("Buyer Type")
                            .foregroundColor(.gray)
                    }
                    
                    .frame(minWidth: 0,maxWidth: .infinity,alignment: .leading)
                    Picker(
                        selection: $detailVM.selectedBuyerType,
                        label: Text(detailVM.selectedBuyerType),
                        content: {
                            ForEach(detailVM.buyerType,id: \.self) { option in
                                Text(option)
                                    .tag(option)
                            }
                        })
                        .pickerStyle(MenuPickerStyle())
                        .padding()
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .border(Color.gray)
                    
                }
                .padding()
                
                VStack{
                    HStack{
                        Text("First Name")
                            .foregroundColor(.gray)
                    }
                    .frame(minWidth:0,maxWidth:.infinity,alignment: .leading)
                    TextField("Enter",text: $detailVM.buyerFirstName)
                        .padding()
                        .overlay()
                    
                }
                .padding()
                
                VStack{
                    HStack{
                        Text("Middle Name")
                            .foregroundColor(.gray)
                    }
                    .frame(minWidth:0,maxWidth:.infinity,alignment: .leading)
                    TextField("Enter",text: $detailVM.buyerMiddleName)
                        .padding()
                        .overlay()
                }
                .padding()
                
                VStack{
                    HStack{
                        Text("Last Name")
                            .foregroundColor(.gray)
                    }
                    .frame(minWidth:0,maxWidth:.infinity,alignment: .leading)
                    
                    TextField("Enter",text: $detailVM.buyerLastName)
                        .padding()
                        .overlay()
                }
                .padding()
                
                
                
                HStack{
                    Text("Seller Details     -")
                        .padding()
                }
                
                VStack{
                    HStack{
                        Text("Seller Type")
                            .foregroundColor(.gray)
                    }
                    .frame(minWidth: 0,maxWidth: .infinity,alignment: .leading)
                    Picker(
                        selection: $detailVM.selectedSellerType,
                        label: Text(detailVM.selectedSellerType),
                        content: {
                            ForEach(detailVM.sellerType,id: \.self) { option in
                                Text(option)
                                    .tag(option)
                            }
                        })
                        .pickerStyle(MenuPickerStyle())
                        .padding()
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .border(Color.gray)
                    
                }
                .padding()
                
                VStack {
                    Text("First Name")
                        .foregroundColor(.gray)
                        .frame(minWidth:0,maxWidth:.infinity,alignment: .leading)
                    
                    TextField("Enter",text: $detailVM.sellerFirstName)
                        .padding()
                        .overlay()
                }
                .padding()
            }
            
            VStack{
                HStack{
                    Text("Middle Name")
                        .foregroundColor(.gray)
                }
                .frame(minWidth:0,maxWidth:.infinity,alignment: .leading)
                TextField("Enter",text: $detailVM.sellerMiddleName)
                    .padding()
                    .overlay()
                
            }
            .padding()
            
            
            VStack{
                HStack{
                    Text("Last Name")
                        .foregroundColor(.gray)
                }
                .frame(minWidth:0,maxWidth:.infinity,alignment: .leading)
                TextField("Enter",text: $detailVM.sellerLastName)
                    .padding()
                    .overlay()
                
            }
            .padding()
            
            HStack{
                Text("Lender Details   -")
                    .padding()
            }
            
            VStack{
                HStack{
                    Text("Lender Name")
                        .foregroundColor(.gray)
                }
                .frame(minWidth:0,maxWidth:.infinity,alignment: .leading)
                TextField("Enter",text: $detailVM.lenderName)
                    .padding()
                    .overlay()
            }
            .padding()
            
            VStack{
                HStack{
                    Text("Loan Number*")
                        .foregroundColor(.gray)
                }
                .frame(minWidth:0,maxWidth:.infinity,alignment: .leading)
                TextField("Enter",text: $detailVM.loanNumber)
                    .padding()
                    .overlay()
                    .keyboardType(.numberPad)
            }
            .padding()
            
            NavigationLink(destination: TabBarView()
                            .navigationBarTitleDisplayMode(.inline)
                            .onAppear(perform: {
                detailVM.isDealDetailsPartFourValid = false
            }),
                           isActive: self.$detailVM.isDealDetailsPartFourValid)
            {
                Text("Submit")
                    .padding()
                    .foregroundColor(.white)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .background(Color(Constants.Color.customDarkBlue))
                    .onTapGesture
                {
                    //Determine DealDetail Validity
                    
                    let isDealdetailValid = self.detailVM.isDealDetailsPartFourComplete
                    
                    //Trigger Logic
                    if isDealdetailValid {
                        //Trigger NavigationLink
                        self.detailVM.isDealDetailsPartFourValid = true
                        self.detailVM.saveDeals()
                        detailVM.clear()
                        print(FileManager.default.urls(for: FileManager.SearchPathDirectory.documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask))
                        
                    }
                    else {
                        self.detailVM.shouldShowDealDetailsAlert = true //trigger Alert
                    }
                    
                }
            }
            .padding([.leading, .trailing], 15)
            .alert(isPresented: $detailVM.shouldShowDealDetailsAlert) {
                Alert(title: Text("Loan Number is Mandatory."))
            }
            .navigationBarHidden(false)
        }
    }
}

struct DealDetailsView4_Previews: PreviewProvider {
    static var previews: some View {
        DealDetailsView4()
    }
}
