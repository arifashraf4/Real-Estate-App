//
//  DealDetailView1.swift
//  Real Estate App
//
//  Created by ManishaThete on 28/12/21.
//



import SwiftUI
import CoreData

struct DealDetailView: View {
    
    @ObservedObject var detailVM = DealDetailViewModel()
    // @State var selectedDate: Date = Date()
    @Environment(\.dismiss) var dismiss

    
    var body: some View {
        
        ScrollView {
            VStack{
                VStack {
                    Text("Deal Details form")
                        .padding()
                        .font(.system(size: 20, weight: .regular, design: .default))
                    Divider()
                        .frame(minWidth: 0,maxWidth:100)
                        .background(Color("CustomDarkBlue"))
                        .foregroundColor(.gray)
                    
                        .padding()
                }
                
                VStack {
                    HStack {
                        Text("File Number")
                            .foregroundColor(.gray)
                        
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    
                    TextField("Enter Agency Name", text: $detailVM.filename)
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 0)
                                    .stroke(lineWidth: 1)
                                    .foregroundColor(.gray))
                    
                }
                
                
                VStack {
                    HStack {
                        Text("Property Type")
                            .foregroundColor(.gray)
                        
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    
                    TextField("Enter Agency Street Address", text: $detailVM.propertytype)
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 0)
                                    .stroke(lineWidth: 1)
                                    .foregroundColor(.gray))
                }
                .padding(.top, 40)
                
                VStack {
                    HStack {
                        Text("Transaction Type")
                            .foregroundColor(.gray)
                        
                        
                    }
                    
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    TextField("Select", text: $detailVM.transactiontype)
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 0)
                                    .stroke(lineWidth: 1)
                                    .foregroundColor(.gray))
                }
                .padding(.top, 40)
                
                // SWITCH Controller
                VStack{
                    
                    Toggle(isOn: $detailVM.isToggle){
                        Text("Cash only")
                            .foregroundColor(Color.gray)
                    }
                    
                }
                .padding(.top,40)
                VStack{
                    Toggle(isOn: $detailVM.isToggle1){
                        Text("Cash+Finance")
                            .foregroundColor(Color.gray)
                    }
                }
                .padding(.top,40)
                
                
                VStack {
                    HStack {
                        Text("Sales Price")
                            .foregroundColor(.gray)
                        
                        
                    }
                    
                    
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    TextField("$ 0,000,000.00", text: $detailVM.salesprice)
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 0)
                                    .stroke(lineWidth: 1)
                                    .foregroundColor(.gray))
                    
                }
                .padding(.top, 40)
                
                VStack {
                    HStack {
                        Text("Loan Amount")
                            .foregroundColor(.gray)
                        
                        
                    }
                    
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    TextField("$ 0,000,000.00", text: $detailVM.loanamount)
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 0)
                                    .stroke(lineWidth: 1)
                                    .foregroundColor(.gray))
                    
                    
                }
                .padding(.top, 40)
                
                VStack {
                    HStack {
                        Text("Booking Date")
                            .foregroundColor(.gray)
                        
                    }
                    
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    
                    TextField("$ 0,000,000.00", text: $detailVM.bookingdate)
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 0)
                                    .stroke(lineWidth: 1)
                                    .foregroundColor(.gray))
                    
                    
                }
                .padding(.top,40)
            }
            .padding()

            VStack{
                VStack {
//                    HStack {
                        Text("Deal Closing Date")
                            .foregroundColor(.gray)
                        
                        
                  //  }
                    
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    
                    TextField("$ 0,000,000.00", text: $detailVM.dealclosingdate)
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 0)
                                    .stroke(lineWidth: 1)
                                    .foregroundColor(.gray))
                    
                }
                .padding(.top, 40)
                
                VStack {
                    HStack {
                        Text("Finance Institude")
                            .foregroundColor(.gray)
                        
                        
                    }
                    
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    
                    TextField("$ 0,000,000.00", text: $detailVM.financeinstitute)
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 0)
                                    .stroke(lineWidth: 1)
                                    .foregroundColor(.gray))
                    
                }
                .padding(.top, 40)
                
            }
            
            .padding()
            
            VStack{
                Text("Contact Details    --")
                    .padding()
        }
        
            VStack {
                VStack {
                    HStack {
                        Text("Deal Agent Name")
                            .foregroundColor(.gray)
                        
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    
                    TextField("Enter here", text: $detailVM.dealagentname)
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 0)
                                    .stroke(lineWidth: 1)
                                    .foregroundColor(.gray))
                        .keyboardType(.numberPad)
                }
                .padding(.top,40)
                
                VStack {
                    HStack {
                        Text("Agency Owner Name")
                            .foregroundColor(.gray)
                        
                        
                    }
                    
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    
                    TextField("Enter here", text: $detailVM.agencyownername)
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 0)
                                    .stroke(lineWidth: 1)
                                    .foregroundColor(.gray))
                }
                
                .padding(.top,40)
                
                VStack {
                    HStack {
                        Text("Mobile Number of Deal Agent")
                            .foregroundColor(.gray)
                        
                        
                    }
                    
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    
                    TextField("XXX-XXX-XXXX", text: $detailVM.mobilenodealagent)
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 0)
                                    .stroke(lineWidth: 1)
                                    .foregroundColor(.gray))
                    
                }
                .padding(.top,40)
                VStack{
                    HStack {
                        Text("Agency Contact Number")
                            .foregroundColor(.gray)
                        
                        
                    }
                    
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    
                    TextField("XXX-XXX-XXXX", text: $detailVM.agencycontactnumber)
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 0)
                                    .stroke(lineWidth: 1)
                                    .foregroundColor(.gray))
                    
                }
                .padding(.top,40)
            }
            .padding()
            
            VStack{
                HStack{
                    Text("Property Details    -")
                        .padding()
                    
                }
                VStack {
                    HStack{
                        Text("Select Property")
                            .foregroundColor(.gray)
                        
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    }
                    TextField("Select", text: $detailVM.selectproperty)
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 0)
                                    .stroke(lineWidth: 1)
                                    .foregroundColor(.gray))
                        .textInputAutocapitalization(.never)
                }
                .padding(.top,40)
                
                VStack {
                    HStack{
                        Text("Property Address")
                            .foregroundColor(.gray)
                        
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    }
                    
                    TextField("Enter Address", text: $detailVM.propertyaddress)
                    
                        .padding()
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .border(Color.gray)
                        .foregroundColor(.gray)
                }
                .padding(.top,40)
                
                
                VStack {
                    HStack {
                        Text("City")
                            .foregroundColor(.gray)
                        
                        
                    }
                    
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    
                    TextField("Enter", text: $detailVM.city)
                    
                        .padding()
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .border(Color.gray)
                        .foregroundColor(.gray)
                }
                
                .padding(.top,40)
                
                VStack {
                    HStack {
                        Text("State")
                            .foregroundColor(.gray)
                    }
                    
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    
                    TextField("Select", text: $detailVM.state)
                    
                        .padding()
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .border(Color.gray)
                        .foregroundColor(.gray)
                    
                    
                }
                .padding(.top,40)
                
                
                
                VStack {
                    HStack{
                        Text("Zip code")
                            .foregroundColor(.gray)
                        
                        
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    }
                    TextField("XXXXX", text: $detailVM.zipcode)
                        .padding()
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .border(Color.gray)
                        .foregroundColor(.gray)
                    
                }
                .padding(.top,40)
                
                VStack {
                    HStack {
                        Text("country")
                            .foregroundColor(.gray)
                        
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    
                    SecureField("Enter", text: $detailVM.country)
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 0)
                                    .stroke(lineWidth: 1)
                                    .frame(minWidth: 0, maxWidth: .infinity)
                                    .border(Color.gray)
                                    .foregroundColor(.gray))
                    
                }
                .padding(.top, 40)
            }
            .padding()
            
            VStack{
                
                VStack {
                    HStack {
                        Text("Municipality")
                            .foregroundColor(.gray)
                        
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    
                    TextField("Enter", text: $detailVM.municipality)
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 0)
                                    .stroke(lineWidth: 1)
                                    .foregroundColor(.gray))
                }
                .padding(.top, 40)
                
                
                VStack {
                    HStack{
                        Text("Subdivision")
                            .foregroundColor(.gray)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    
                    TextField("Enter", text: $detailVM.subdivision)
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 0)
                                    .stroke(lineWidth: 1)
                                    .foregroundColor(.gray))
                }
                .padding(.top,40)
                
                VStack {
                    HStack{
                        Text("Lot")
                            .foregroundColor(.gray)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    
                    TextField("Enter", text: $detailVM.lot)
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 0)
                                    .stroke(lineWidth: 1)
                                    .foregroundColor(.gray))
                }
                .padding(.top,40)
                
                VStack {
                    HStack{
                        Text("Parcel ID")
                            .foregroundColor(.gray)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    
                    TextField("Enter", text: $detailVM.parcel)
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 0)
                                    .stroke(lineWidth: 1)
                                    .foregroundColor(.gray))
                }
                .padding(.top,40)
                
            }
            .padding()
            
            
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
                        selection: $detailVM.selectedbuyer,
                        label: Text(detailVM.selectedbuyer),
                        content: {
                            ForEach(detailVM.buyertype,id: \.self) { option in
                                Text(option)
                                    .tag(option)
                            }
                        })
                        .pickerStyle(MenuPickerStyle())
                        .padding()
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .border(Color.gray)
                    
                }
                .padding(.top,40)
                
                VStack{
                    HStack{
                        Text("First Name")
                            .foregroundColor(.gray)
                    }
                    .frame(minWidth:0,maxWidth:.infinity,alignment: .leading)
                    TextField("Enter",text: $detailVM.buyerfirstname)
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 0)
                                    .stroke(lineWidth: 1)
                                    .foregroundColor(.gray))
                    
                }
                .padding(.top,40)
                
            }
            .padding()
            
            
            VStack{
                
                VStack{
                    HStack{
                        Text("Middle Name")
                            .foregroundColor(.gray)
                    }
                    .frame(minWidth:0,maxWidth:.infinity,alignment: .leading)
                    TextField("Enter",text: $detailVM.buyermiddlename)
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 0)
                                    .stroke(lineWidth: 1)
                                    .foregroundColor(.gray))
                    
                }
                .padding(.top,40)
                
                VStack{
                    HStack{
                        Text("Last Name")
                            .foregroundColor(.gray)
                    }
                    .frame(minWidth:0,maxWidth:.infinity,alignment: .leading)
                    TextField("Enter",text: $detailVM.buyerlastname)
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 0)
                                    .stroke(lineWidth: 1)
                                    .foregroundColor(.gray))
                    
                }
                .padding(.top,40)
                VStack{
                
                HStack{
                    Text("Seller Details     -")
                    
                        .padding()
                }
                }
                VStack{
                    HStack{
                        Text("Buyer Type")
                            .foregroundColor(.gray)
                    }
                    .frame(minWidth: 0,maxWidth: .infinity,alignment: .leading)
                    Picker(
                        selection: $detailVM.selectedseller,
                        label: Text(detailVM.selectedseller),
                        content: {
                            ForEach(detailVM.sellertype,id: \.self) { option in
                                Text(option)
                                    .tag(option)
                            }
                        })
                        .pickerStyle(MenuPickerStyle())
                        .padding()
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .border(Color.gray)
                    
                }
                .padding(.top,40)
                
                VStack{
                    HStack{
                        Text("First Name")
                            .foregroundColor(.gray)
                    }
                    .frame(minWidth:0,maxWidth:.infinity,alignment: .leading)
                    TextField("Enter",text: $detailVM.sellerfirstname)
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 0)
                                    .stroke(lineWidth: 1)
                                    .foregroundColor(.gray))
                    
                }
                .padding(.top,40)
            }
            .padding()
            
            VStack{
                VStack{
                    HStack{
                        Text("Middle Name")
                            .foregroundColor(.gray)
                    }
                    .frame(minWidth:0,maxWidth:.infinity,alignment: .leading)
                    TextField("Enter",text: $detailVM.buyerfirstname)
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 0)
                                    .stroke(lineWidth: 1)
                                    .foregroundColor(.gray))
                    
                }
                .padding(.top,40)
                
                
                VStack{
                    HStack{
                        Text("Last Name")
                            .foregroundColor(.gray)
                    }
                    .frame(minWidth:0,maxWidth:.infinity,alignment: .leading)
                    TextField("Enter",text: $detailVM.buyerlastname)
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 0)
                                    .stroke(lineWidth: 1)
                                    .foregroundColor(.gray))
                    
                }
                .padding(.top,40)
                VStack{
                HStack{
                    Text("Lender Details   -")
                        .padding()
                }
                }
                VStack{
                    HStack{
                        Text("Lender Name")
                            .foregroundColor(.gray)
                    }
                    .frame(minWidth:0,maxWidth:.infinity,alignment: .leading)
                    TextField("Enter",text: $detailVM.lenderename)
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 0)
                                    .stroke(lineWidth: 1)
                                    .foregroundColor(.gray))
                    
                    
                }
                .padding(.top,40)
                
                VStack{
                    HStack{
                        Text("Loan Number")
                            .foregroundColor(.gray)
                    }
                    
                    .frame(minWidth:0,maxWidth:.infinity,alignment: .leading)
                    TextField("Enter",text: $detailVM.loannumber)
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 0)
                                    .stroke(lineWidth: 1)
                                    .foregroundColor(.gray))
                    
                    
                }
                .padding(.top,40)
                
            }
                .padding()
    
                Button(action: {
                    dismiss()
                    
                }, label: {
                    Text("Submit")
                        .padding()
                    .foregroundColor(.white)
                    .frame(minWidth: 0, maxWidth: .infinity,alignment: .center)
                    .background(Color("CustomDarkBlue"))
                    
                })
    
            .padding()
            
        }
    }
    
}
struct DealDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DealDetailView().previewDevice("iPhone 11")
        
    }
    
}


