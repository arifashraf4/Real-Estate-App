//
//  DealDetailsView.swift
//  Real Estate App
//
//  Created by arifashraf on 28/12/21.
//

import SwiftUI
import Combine

struct DealDetailsView: View {
    
    @ObservedObject var detailVM = DealDetailsViewModel.shared
    @Environment(\.dismiss) var dismiss
    @State var deal = Deal()
    @State var isShowPhotoLibrary = false
    
    var body: some View {
        
        let cashOnly = Binding<Bool>(get: { detailVM.isCashOnlyToggle },
                                     set: { detailVM.isCashOnlyToggle = $0
            detailVM.isCashAndFinanceToggle = !detailVM.isCashOnlyToggle
        })
        
        let cashAndFinance = Binding<Bool>(get: { detailVM.isCashAndFinanceToggle },
                                           set: { detailVM.isCashOnlyToggle = detailVM.isCashAndFinanceToggle
            detailVM.isCashAndFinanceToggle = $0
        })
        
        ScrollView {
            
            VStack{
                
                Divider()
                    .frame(minWidth: 0,maxWidth:100)
                    .background(Color(Constants.Color.customDarkBlue))
                    .foregroundColor(.gray)
                    .padding()
                
                VStack {
                    
                    HStack {
                        
                        Text("File Number*")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    }
                    
                    TextField("SP-05-AT-16122021", text: $detailVM.fileNumber)
                        .padding()
                        .overlay()
                        .keyboardType(.numberPad)
                    
                }
                .padding()
                
                VStack {
                    
                    HStack {
                        
                        Text("Property Type*")
                            .foregroundColor(.gray)
                        
                    }
                    .frame(minWidth: 0,maxWidth: .infinity,alignment: .leading)
                    
                    Picker(
                        selection: $detailVM.selectedPropertyType,
                        label: Text(detailVM.selectedPropertyType),
                        content: {
                            ForEach(detailVM.propertyType1,id: \.self) { option in
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
                    
                    HStack {
                        
                        Text("Transaction Type*")
                            .foregroundColor(.gray)
                        
                    }
                    .frame(minWidth: 0,maxWidth: .infinity,alignment: .leading)
                    
                    Picker(
                        selection: $detailVM.selectedTransactionType,
                        label: Text(detailVM.selectedTransactionType),
                        content: {
                            ForEach(detailVM.transactionType,id: \.self) { option in
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
                
                // SWITCH Controller
                VStack {
                    
                    Toggle(isOn: cashOnly) {
                        
                        Text("Cash only")
                            .foregroundColor(Color.gray)
                        
                    }
                    .tint(Color(Constants.Color.customDarkBlue))
                    
                }
                .padding()
                
                VStack {
                    
                    Toggle(isOn: cashAndFinance) {
                        
                        Text("Cash+Finance")
                            .foregroundColor(Color.gray)
                        
                    }
                    .tint(Color(Constants.Color.customDarkBlue))
                    
                }
                .padding()
                
                
            }
            
            VStack {
                
                HStack {
                    
                    Text("Sales Price")
                        .foregroundColor(.gray)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    
                }
                
                TextField("$ 0,000,000.00", text: $detailVM.salesPrice)
                    .padding()
                    .keyboardType(.numberPad)
                    .overlay()
                
            }
            .padding()
            
            VStack{
                
                HStack{
                    
                    Text("Loan Amount")
                        .foregroundColor(.gray)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    
                }
                
                TextField("$ 0,000,000.00", text: $detailVM.loanAmount)
                    .padding()
                    .overlay()
                    .keyboardType(.numberPad)
                
            }
            .padding()
            
            VStack{
                
                Text("Booking Date")
                    .foregroundColor(.gray)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                
                DatePicker("Select a date:", selection: $detailVM.selectedBookingDate, displayedComponents: [.date])
                    .padding()
                    .overlay()
                
            }
            .padding()
            
            VStack {
                
                Text("Deal Closing Date")
                    .foregroundColor(.gray)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                
                DatePicker("Select a date:", selection: $detailVM.selectedDealClosingDate, displayedComponents: [.date])
                    .padding()
                    .overlay()
                    .datePickerStyle(.compact)
                
            }
            .padding()
            
            VStack {
                
                HStack {
                    
                    Text("Finance Institute")
                        .foregroundColor(.gray)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    
                }
                
                TextField("Select", text: $detailVM.financeInstitute)
                    .padding()
                    .overlay()
                
            }
            .padding()
            
            NavigationLink(destination: DealDetailsView2()
                            .onAppear(perform: {
                detailVM.isDealDetailsPartOneValid = false
            }),
                           isActive: self.$detailVM.isDealDetailsPartOneValid) {
                
                Text("Next")
                    .padding()
                    .foregroundColor(.white)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .background(Color(Constants.Color.customDarkBlue))
                    .onTapGesture {
                    //Determine DealDetail Validity
                    let isDealdetailValid = self.detailVM.isDealDetailsPartOneComplete
                    
                    //Trigger Logic
                    if isDealdetailValid {
                        //Trigger NavigationLink
                        self.detailVM.isDealDetailsPartOneValid = true
                    } else {
                        //Trigger Alert
                        self.detailVM.shouldShowDealDetailsAlert = true
                    }
                }
                
            }
            .padding([.leading, .trailing], 15)
            .alert(isPresented: $detailVM.shouldShowDealDetailsAlert) {
                Alert(title: Text("File Number, Transaction Type & Property Type is Mandatory"))
            }
            
        }
        .navigationBarHidden(false)
        .navigationBarTitleDisplayMode(.inline)
        
    }
    
}

struct DealDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DealDetailsView()
    }
}
