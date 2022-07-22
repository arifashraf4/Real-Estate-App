//
//  DealDetailsView.swift
//  Real Estate App
//
//  Created by arifashraf on 28/12/21.
//

import SwiftUI
import Combine

struct ExistingDealDetailsView: View {
    
    @StateObject var existingDealDetailsVM = ExistingDealDetailsViewModel()
    @StateObject var detailVM = DealDetailsViewModel.shared
    @Environment(\.dismiss) var dismiss
    
    @State var deal = Deal()
    
    @State var isShowPhotoLibrary = false
    
    var body: some View {
        
        ScrollView {
            
            VStack(){
                
                Divider()
                    .frame(minWidth: 0,maxWidth:100)
                    .background(Color(Constants.Color.customDarkBlue))
                    .foregroundColor(.gray)
                    .padding()
                
                VStack(spacing: 0) {
                    HStack(spacing: 0){
                        Text("File Number")
                            .padding()
                            .frame(minWidth: 0,maxWidth: .infinity,minHeight: 0, maxHeight: .infinity, alignment: .leading)
                            .foregroundColor(Color(Constants.Color.customDarkBlue))
                            .background(Color(UIColor.systemGray6))
                            .overlay()
                        
                        TextField("SP-05-AT-16122021", text: $deal.fileNumber)
                            .padding()
                            .overlay()
                            .keyboardType(.numberPad)
                            .disabled(true)
                            .foregroundColor(.black)
                        
                    }
                    
                    HStack(spacing: 0){
                        Text("Property Type")
                            .foregroundColor(Color(Constants.Color.customDarkBlue))
                            .padding()
                            .frame(minWidth: 0,maxWidth: .infinity,minHeight: 0, maxHeight: .infinity, alignment: .leading)
                            .background(Color(UIColor.systemGray6))
                            .overlay()
                        
                        Text(deal.propertyType)
                            .padding()
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    }
                    
                    HStack(spacing: 0){
                        Text("Transaction Type")
                            .foregroundColor(Color(Constants.Color.customDarkBlue))
                            .padding()
                            .frame(minWidth: 0,maxWidth: .infinity,minHeight: 0, maxHeight: .infinity, alignment: .leading)
                            .background(Color(UIColor.systemGray6))
                        
                        Text(deal.transactionType)
                            .padding()
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .overlay()
                    }
                }
                .overlay(RoundedRectangle(cornerRadius: 0)
                            .stroke(lineWidth: 1)
                            .foregroundColor(.gray))
                .padding()
                
                
                
                //                VStack{
                //                    HStack{
                //                        Text("Property Type")
                //                            .foregroundColor(.gray)
                //                    }
                //                    .frame(minWidth: 0,maxWidth: .infinity,alignment: .leading)
                //                    Picker(
                //                        selection: $deal.propertyType,
                //                        label: Text(deal.propertyType),
                //                        content: {
                //                            ForEach(detailVM.propertyType1, id: \.self) { option in
                //                                Text(option)
                //                                    .tag(option)
                //                            }
                //                        })
                //                        .pickerStyle(MenuPickerStyle())
                //                        .padding()
                //                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                //                        .border(Color.gray)
                //
                //                }
                //                .padding()
                
                //                VStack{
                //                    HStack{
                //                        Text("Transaction Type*")
                //                            .foregroundColor(.gray)
                //                    }
                //                    .frame(minWidth: 0,maxWidth: .infinity,alignment: .leading)
                //                    Picker(
                //                        selection: $deal.transactionType,
                //                        label: Text(deal.transactionType),
                //                        content: {
                //                            ForEach(detailVM.transactionType,id: \.self) { option in
                //                                Text(option)
                //                                    .tag(option)
                //                            }
                //                        })
                //                        .pickerStyle(MenuPickerStyle())
                //                        .padding()
                //                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                //                        .border(Color.gray)
                //
                //                }
                //                .padding()
                //                // SWITCH Controller
                //                VStack {
                //                    Toggle(isOn: cashOnly){
                //                        Text("Cash only")
                //                            .foregroundColor(Color.gray)
                //                    }
                //                    .tint(Color("CustomDarkBlue"))
                //                }
                //                .padding()
                //                VStack{
                //                    Toggle(isOn: cashAndFinance){
                //                        Text("Cash+Finance")
                //                            .foregroundColor(Color.gray)
                //                    }
                //                    .tint(Color("CustomDarkBlue"))
                //                }
                //                .padding()
                
                
            }
            
            //            VStack{
            //                HStack {
            //                    
            //                    Text("Sales Price")
            //                        .foregroundColor(.gray)
            //                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            //                    
            //                }
            //                TextField("$ 0,000,000.00", text: $deal.salesPrice)
            //                    .padding()
            //                    .keyboardType(.numberPad)
            //                    .overlay(RoundedRectangle(cornerRadius: 0)
            //                                .stroke(lineWidth: 1)
            //                                .foregroundColor(.gray))
            //            }
            //            .padding()
            //            
            //            VStack{
            //                
            //                HStack{
            //                    
            //                    Text("Loan Amount")
            //                        .foregroundColor(.gray)
            //                    
            //                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            //                }
            //                TextField("$ 0,000,000.00", text: $deal.loanAmount)
            //                    .padding()
            //                    .overlay(RoundedRectangle(cornerRadius: 0)
            //                                .stroke(lineWidth: 1)
            //                                .foregroundColor(.gray))
            //                    .keyboardType(.numberPad)
            //            }
            //            .padding()
            //            
            //            VStack{
            //                
            //                Text("Booking Date")
            //                    .foregroundColor(.gray)
            //                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            //                
            //                DatePicker("Select a date:", selection: $deal.bookingDate, displayedComponents: [.date])
            //                    .padding()
            //                    .overlay(RoundedRectangle(cornerRadius: 0)
            //                                .stroke(lineWidth: 1)
            //                                .foregroundColor(.gray))
            //                
            //            }
            //            
            //            .padding()
            //            VStack{
            //                
            //                Text("Deal Closing Date")
            //                    .foregroundColor(.gray)
            //                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            //                
            //                DatePicker("Select a date:", selection: $deal.dealClosingDate, displayedComponents: [.date])
            //                    .padding()
            //                    .overlay(RoundedRectangle(cornerRadius: 0)
            //                                .stroke(lineWidth: 1)
            //                                .foregroundColor(.gray))
            //                    .datePickerStyle(.compact)
            //            }
            //            .padding()
            //            
            //            
            //            VStack{
            //                HStack{
            //                    Text("Finance Institute")
            //                        .foregroundColor(.gray)
            //                    
            //                    
            //                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            //                }
            //                TextField("Select", text: $deal.financeInstitute)
            //                    .padding()
            //                    .overlay(RoundedRectangle(cornerRadius: 0)
            //                                .stroke(lineWidth: 1)
            //                                .foregroundColor(.gray))
            //            }
            //            .padding()
            
            
            //            VStack{
            //
            //                VStack {
            //
            //                    Text("Contact Details       --")
            //
            //                    VStack {
            //                        HStack{
            //                            Text("Deal Agent Name*")
            //                                .foregroundColor(.gray)
            //                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            //                        }
            //                        TextField("Enter here...", text: $deal.dealAgentName)
            //                            .padding()
            //                            .overlay(RoundedRectangle(cornerRadius: 0)
            //                                        .stroke(lineWidth: 1)
            //                                        .foregroundColor(.gray))
            //                    }
            //                    .padding()
            //
            //                    VStack{
            //                        HStack {
            //                            Text("Agency Owner Name")
            //                                .foregroundColor(.gray)
            //
            //
            //                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            //                        }
            //                        TextField("Enter here...", text: $deal.agencyOwnerName)
            //
            //                            .padding()
            //                            .overlay(RoundedRectangle(cornerRadius: 0)
            //                                        .stroke(lineWidth: 1)
            //                                        .foregroundColor(.gray))
            //                    }
            //
            //                    .padding()
            //
            //                    VStack{
            //                        HStack{
            //
            //                            Text("Mobile Number of Deal Agent")
            //                                .foregroundColor(.gray)
            //
            //                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            //                        }
            //
            //                        TextField("XXX-XXX-XXXX", text:$deal.dealAgentMobileNumber)
            //                            .padding()
            //                            .overlay(RoundedRectangle(cornerRadius: 0)
            //                                        .stroke(lineWidth: 1)
            //                                        .foregroundColor(.gray))
            //                            .keyboardType(.numberPad)
            //                    }
            //                    .padding()
            //
            //                    VStack{
            //                        HStack {
            //
            //                            Text("Agency Contact Number")
            //                                .foregroundColor(.gray)
            //                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            //
            //                        }
            //                        TextField("XXX-XXX-XXXX", text: $deal.agencyContactNumber)
            //                            .padding()
            //                            .keyboardType(.numberPad)
            //                            .overlay(RoundedRectangle(cornerRadius: 0)
            //                                        .stroke(lineWidth: 1)
            //                                        .foregroundColor(.gray))
            //                    }
            //                    .padding()
            //
            //                    VStack {
            //
            //                        Text("Property Details       --")
            //
            //                        VStack {
            //                            HStack{
            //                                Text("Select property")
            //                                    .foregroundColor(.gray)
            //                            }
            //                            .frame(minWidth: 0,maxWidth: .infinity,alignment: .leading)
            //                            Picker(
            //                                selection: $deal.selectProperty,
            //                                label: Text(deal.selectProperty),
            //                                content: {
            //                                    ForEach(detailVM.selectProperty1,id: \.self) { option in
            //                                        Text(option)
            //                                            .tag(option)
            //                                    }
            //                                })
            //                                .pickerStyle(MenuPickerStyle())
            //                                .padding()
            //                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            //                                .border(Color.gray)
            //
            //                        }
            //                        .padding()
            //
            //                        VStack{
            //                            HStack {
            //                                Text("Property Address*")
            //                                    .foregroundColor(.gray)
            //
            //
            //                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            //                            }
            //                            TextField("Enter Here...", text: $deal.propertyAddress)
            //
            //                                .padding()
            //                                .overlay(RoundedRectangle(cornerRadius: 0)
            //                                            .stroke(lineWidth: 1)
            //                                            .foregroundColor(.gray))
            //                        }
            //
            //                        .padding()
            //
            //                        VStack {
            //                            HStack{
            //                                Text("City")
            //                                    .foregroundColor(.gray)
            //
            //                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            //                            }
            //                            TextField("Enter", text: $deal.propertyCity)
            //                                .padding()
            //                                .overlay(RoundedRectangle(cornerRadius: 0)
            //                                            .stroke(lineWidth: 1)
            //                                            .foregroundColor(.gray))
            //                        }
            //                        .padding()
            //
            //                        VStack{
            //                            HStack{
            //                                Text("States")
            //                                    .foregroundColor(.gray)
            //                            }
            //                            .frame(minWidth: 0,maxWidth: .infinity,alignment: .leading)
            //                            Picker(
            //                                selection: $deal.propertyState,
            //                                label: Text(deal.propertyState),
            //                                content: {
            //                                    ForEach(detailVM.states1,id: \.self) { option in
            //                                        Text(option)
            //                                            .tag(option)
            //                                    }
            //                                })
            //                                .pickerStyle(MenuPickerStyle())
            //                                .padding()
            //                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            //                                .border(Color.gray)
            //
            //                        }
            //                        .padding()
            //
            //                        VStack{
            //                            HStack{
            //
            //                                Text("Zip code")
            //                                    .foregroundColor(.gray)
            //
            //                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            //                            }
            //
            //                            TextField("XXXXX", text:$deal.propertyZipCode)
            //                                .padding()
            //                                .overlay(RoundedRectangle(cornerRadius: 0)
            //                                            .stroke(lineWidth: 1)
            //                                            .foregroundColor(.gray))
            //                                .keyboardType(.numberPad)
            //                                .onReceive(Just(self.deal.propertyZipCode)) { inputValue in
            //                                    if inputValue.count > 6 {
            //                                        self.deal.propertyZipCode.removeLast()
            //                                    }
            //                                }
            //                        }
            //                        .padding()
            //
            //                        VStack{
            //                            HStack {
            //
            //                                Text("Country")
            //                                    .foregroundColor(.gray)
            //                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            //
            //                            }
            //                            TextField("Enter", text: $deal.propertyCountry)
            //                                .padding()
            //
            //                                .overlay(RoundedRectangle(cornerRadius: 0)
            //                                            .stroke(lineWidth: 1)
            //                                            .foregroundColor(.gray))
            //                        }
            //                        .padding()
            //
            //                        VStack {
            //                            HStack{
            //                                Text("Municipality")
            //                                    .foregroundColor(.gray)
            //
            //                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            //                            }
            //                            TextField("Enter", text: $deal.propertyMunicipality)
            //                                .padding()
            //                                .overlay(RoundedRectangle(cornerRadius: 0)
            //                                            .stroke(lineWidth: 1)
            //                                            .foregroundColor(.gray))
            //                        }
            //                        .padding()
            //                    }
            //
            //                    VStack{
            //                        HStack {
            //                            Text("Subdivision")
            //                                .foregroundColor(.gray)
            //
            //
            //                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            //                        }
            //                        TextField("Enter", text: $deal.propertySubdivision)
            //
            //                            .padding()
            //                            .overlay(RoundedRectangle(cornerRadius: 0)
            //                                        .stroke(lineWidth: 1)
            //                                        .foregroundColor(.gray))
            //                    }
            //                    .padding()
            //
            //                    VStack{
            //                        HStack{
            //
            //                            Text("Lot")
            //                                .foregroundColor(.gray)
            //                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            //                        }
            //
            //                        TextField("Enter", text: $deal.propertyLot)
            //                            .padding()
            //                            .overlay(RoundedRectangle(cornerRadius: 0)
            //                                        .stroke(lineWidth: 1)
            //                                        .foregroundColor(.gray))
            //                            .keyboardType(.numberPad)
            //                    }
            //                    .padding()
            //
            //                }
            //                VStack{
            //                    VStack{
            //                        HStack {
            //
            //                            Text("Parcel ID")
            //                                .foregroundColor(.gray)
            //                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            //
            //                        }
            //                        TextField("Enter", text: $deal.propertyParcelID)
            //                            .padding()
            //                            .keyboardType(.numberPad)
            //                            .overlay(RoundedRectangle(cornerRadius: 0)
            //                                        .stroke(lineWidth: 1)
            //                                        .foregroundColor(.gray))
            //                    }
            //                    .padding()
            //
            //                    // property Image
            //                    VStack {
            //                        Text("Property Image")
            //                            .foregroundColor(.gray)
            //                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            //                            .padding()
            //
            //                        HStack {
            //
            //                            Button(action: {
            //                                isShowPhotoLibrary = true
            //                            }) {
            //                                VStack {
            //                                    Image(systemName: "square.and.arrow.up")
            //                                        .font(.system(size: 20))
            //
            //                                    Text("Upload Photo")
            //                                        .font(.body)
            //
            //                                }
            //                                .frame(width: 100, height: 100, alignment: .center)
            //                                .background(.gray)
            //                                .foregroundColor(.white)
            //                                .cornerRadius(10)
            //                            }
            //
            //                            Image(uiImage: detailVM.propertyImage)
            //                                .resizable()
            //                                .scaledToFill()
            //                                .frame(width: 100, height: 100, alignment: .trailing)
            //                                .cornerRadius(10)
            //                        }
            //                    }
            //                    .sheet(isPresented: $isShowPhotoLibrary) {
            //                        ImagePicker(sourceType: .photoLibrary, selectedImage: $detailVM.propertyImage)
            //                    }
            //                    .padding()
            //                    .padding(.leading, -10)
            //
            //                    VStack{
            //
            //                        HStack{
            //                            Text("Buyer Details   -")
            //                                .padding()
            //                        }
            //
            //                        VStack{
            //                            HStack{
            //                                Text("Buyer Type")
            //                                    .foregroundColor(.gray)
            //                            }
            //
            //                            .frame(minWidth: 0,maxWidth: .infinity,alignment: .leading)
            //                            Picker(
            //                                selection: $deal.buyerType,
            //                                label: Text(deal.buyerType),
            //                                content: {
            //                                    ForEach(detailVM.buyerType,id: \.self) { option in
            //                                        Text(option)
            //                                            .tag(option)
            //                                    }
            //                                })
            //                                .pickerStyle(MenuPickerStyle())
            //                                .padding()
            //                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            //                                .border(Color.gray)
            //
            //                        }
            //                        .padding()
            //
            //                        VStack{
            //                            HStack{
            //                                Text("First Name")
            //                                    .foregroundColor(.gray)
            //                            }
            //                            .frame(minWidth:0,maxWidth:.infinity,alignment: .leading)
            //                            TextField("Enter",text: $deal.buyerFirstName)
            //                                .padding()
            //                                .overlay(RoundedRectangle(cornerRadius: 0)
            //                                            .stroke(lineWidth: 1)
            //                                            .foregroundColor(.gray))
            //
            //                        }
            //                        .padding()
            //
            //                        VStack{
            //                            HStack{
            //                                Text("Middle Name")
            //                                    .foregroundColor(.gray)
            //                            }
            //                            .frame(minWidth:0,maxWidth:.infinity,alignment: .leading)
            //                            TextField("Enter",text: $deal.buyerMiddleName)
            //                                .padding()
            //                                .overlay(RoundedRectangle(cornerRadius: 0)
            //                                            .stroke(lineWidth: 1)
            //                                            .foregroundColor(.gray))
            //                        }
            //                        .padding()
            //
            //                        VStack{
            //                            HStack{
            //                                Text("Last Name")
            //                                    .foregroundColor(.gray)
            //                            }
            //                            .frame(minWidth:0,maxWidth:.infinity,alignment: .leading)
            //
            //                            TextField("Enter",text: $deal.buyerLastName)
            //                                .padding()
            //                                .overlay(RoundedRectangle(cornerRadius: 0)
            //                                            .stroke(lineWidth: 1)
            //                                            .foregroundColor(.gray))
            //                        }
            //                        .padding()
            //
            //
            //
            //                        HStack{
            //                            Text("Seller Details     -")
            //                                .padding()
            //                        }
            //
            //                        VStack{
            //                            HStack{
            //                                Text("Seller Type")
            //                                    .foregroundColor(.gray)
            //                            }
            //                            .frame(minWidth: 0,maxWidth: .infinity,alignment: .leading)
            //                            Picker(
            //                                selection: $deal.sellerType,
            //                                label: Text(deal.sellerType),
            //                                content: {
            //                                    ForEach(detailVM.sellerType,id: \.self) { option in
            //                                        Text(option)
            //                                            .tag(option)
            //                                    }
            //                                })
            //                                .pickerStyle(MenuPickerStyle())
            //                                .padding()
            //                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            //                                .border(Color.gray)
            //
            //                        }
            //                        .padding()
            //
            //                        VStack {
            //                            Text("First Name")
            //                                .foregroundColor(.gray)
            //                                .frame(minWidth:0,maxWidth:.infinity,alignment: .leading)
            //
            //                            TextField("Enter",text: $deal.sellerFirstName)
            //                                .padding()
            //                                .overlay(RoundedRectangle(cornerRadius: 0)
            //                                            .stroke(lineWidth: 1)
            //                                            .foregroundColor(.gray))
            //                        }
            //                        .padding()
            //                    }
            //
            //                    VStack{
            //                        HStack{
            //                            Text("Middle Name")
            //                                .foregroundColor(.gray)
            //                        }
            //                        .frame(minWidth:0,maxWidth:.infinity,alignment: .leading)
            //                        TextField("Enter",text: $deal.sellerMiddleName)
            //                            .padding()
            //                            .overlay(RoundedRectangle(cornerRadius: 0)
            //                                        .stroke(lineWidth: 1)
            //                                        .foregroundColor(.gray))
            //
            //                    }
            //                    .padding()
            //
            //
            //                    VStack{
            //                        HStack{
            //                            Text("Last Name")
            //                                .foregroundColor(.gray)
            //                        }
            //                        .frame(minWidth:0,maxWidth:.infinity,alignment: .leading)
            //                        TextField("Enter",text: $deal.sellerLastName)
            //                            .padding()
            //                            .overlay(RoundedRectangle(cornerRadius: 0)
            //                                        .stroke(lineWidth: 1)
            //                                        .foregroundColor(.gray))
            //
            //                    }
            //                    .padding()
            //
            //                    HStack{
            //                        Text("Lender Details   -")
            //                            .padding()
            //                    }
            //
            //                    VStack{
            //                        HStack{
            //                            Text("Lender Name")
            //                                .foregroundColor(.gray)
            //                        }
            //                        .frame(minWidth:0,maxWidth:.infinity,alignment: .leading)
            //                        TextField("Enter",text: $deal.lenderName)
            //                            .padding()
            //                            .overlay(RoundedRectangle(cornerRadius: 0)
            //                                        .stroke(lineWidth: 1)
            //                                        .foregroundColor(.gray))
            //                    }
            //                    .padding()
            //
            //                    VStack{
            //                        HStack{
            //                            Text("Loan Number*")
            //                                .foregroundColor(.gray)
            //                        }
            //                        .frame(minWidth:0,maxWidth:.infinity,alignment: .leading)
            //                        TextField("Enter",text: $deal.lenderLoanNumber)
            //                            .padding()
            //                            .overlay(RoundedRectangle(cornerRadius: 0)
            //                                        .stroke(lineWidth: 1)
            //                                        .foregroundColor(.gray))
            //                            .keyboardType(.numberPad)
            //                    }
            //                    .padding()
            //
            //                    NavigationLink(destination: TabBarView()
            //                                    .navigationBarBackButtonHidden(true)
            //                                    .onAppear(perform: {
            //                        existingDealDetailsVM.toggle = false
            //                    }), isActive: $existingDealDetailsVM.toggle)
            //                    {
            //                        Text("Update")
            //                            .padding()
            //                            .foregroundColor(.white)
            //                            .frame(minWidth: 0, maxWidth: .infinity)
            //                            .background(Color("CustomDarkBlue"))
            //                            .onTapGesture
            //                        {
            //                            existingDealDetailsVM.toggle = true
            //                            CoreDataManager.shared.save()
            //                            print(FileManager.default.urls(for: FileManager.SearchPathDirectory.documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask))
            //                        }
            //                    }
            //                    .padding([.leading, .trailing], 15)
            //                }
            //            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarTitle("Deal Details Form")
    }
}
struct ExistingDealDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ExistingDealDetailsView()
    }
}
