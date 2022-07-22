//
//  DealDetailsView3.swift
//  Real Estate App
//
//  Created by ManishaThete on 27/01/22.
//

import SwiftUI
import Combine
struct DealDetailsView3: View {
    @StateObject var detailVM = DealDetailsViewModel.shared
    @Environment(\.dismiss) var dismiss
    @State var isShowPhotoLibrary = false
    var body: some View {
        ScrollView{
            VStack {
                Text("Property Details       --")
                
                VStack {
                    
                    Text("Select property")
                        .foregroundColor(.gray)
                    
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    Picker(
                        selection: $detailVM.selectedPropertyAddress,
                        label: Text(detailVM.selectedPropertyAddress),
                        content: {
                            ForEach(detailVM.selectProperty1,id: \.self) { option in
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
                    HStack {
                        Text("Property Address*")
                            .foregroundColor(.gray)
                        
                        
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    }
                    TextField("Enter Here...", text: $detailVM.propertyAddress)
                    
                        .padding()
                        .overlay()
                }
                
                .padding()
                
                VStack {
                    HStack{
                        Text("City")
                            .foregroundColor(.gray)
                        
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    }
                    TextField("Enter", text: $detailVM.city)
                        .padding()
                        .overlay()
                }
                .padding()
                
                VStack{
                    HStack {
                        Text("State")
                            .foregroundColor(.gray)
                        
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    
                    Picker(
                        selection: $detailVM.selectedState,
                        label: Text(detailVM.selectedState),
                        content: {
                            ForEach(detailVM.states1, id: \.self) { option in
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
                        
                        Text("Zip code")
                            .foregroundColor(.gray)
                        
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    }
                    
                    TextField("XXXXX", text:$detailVM.zipcode)
                        .padding()
                        .overlay()
                        .keyboardType(.numberPad)
                        .onReceive(Just(self.detailVM.zipcode)) { inputValue in
                            if inputValue.count > 6 {
                                self.detailVM.zipcode.removeLast()
                            }
                        }
                }
                .padding()
                
                VStack{
                    HStack {
                        
                        Text("Country")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        
                    }
                    TextField("Enter", text: $detailVM.country)
                        .padding()
                    
                        .overlay()
                }
                .padding()
                
                VStack {
                    HStack{
                        Text("Municipality")
                            .foregroundColor(.gray)
                        
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    }
                    TextField("Enter", text: $detailVM.municipality)
                        .padding()
                        .overlay()
                }
                .padding()
                // }
                
                VStack{
                    HStack {
                        Text("Subdivision")
                            .foregroundColor(.gray)
                        
                        
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    }
                    TextField("Enter", text: $detailVM.subdivision)
                    
                        .padding()
                        .overlay()
                }
                .padding()
                
                VStack{
                    HStack{
                        
                        Text("Lot")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    }
                    
                    TextField("Enter", text:$detailVM.lot)
                        .padding()
                        .overlay()
                        .keyboardType(.numberPad)
                }
                .padding()
                
            }
            VStack{
                VStack{
                    HStack {
                        
                        Text("Parcel ID")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        
                    }
                    TextField("Enter", text: $detailVM.parcel)
                        .padding()
                        .keyboardType(.numberPad)
                        .overlay()
                }
                .padding()
                
                // Deal Property Image
                VStack {
                    Text("Property Image")
                        .foregroundColor(.gray)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding()
                    
                    HStack {
                        
                        Button(action: {
                            isShowPhotoLibrary = true
                        }) {
                            VStack {
                                Image(systemName: "square.and.arrow.up")
                                    .font(.system(size: 20))
                                
                                Text("Upload Photo")
                                    .font(.body)
                                
                            }
                            .frame(width: 100, height: 100, alignment: .center)
                            .background(.gray)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        }
                        
                        Image(uiImage: detailVM.propertyImage)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100, alignment: .trailing)
                            .cornerRadius(10)
                    }
                }
                .sheet(isPresented: $isShowPhotoLibrary) {
                    ImagePicker(sourceType: .photoLibrary, selectedImage: $detailVM.propertyImage)
                }
                .padding()
                .padding(.leading, -10)
                
            }
            
            NavigationLink(destination: DealDetailsView4()
                            .onAppear(perform: {
                detailVM.isDealDetailsPartThreeValid = false
            }),
                           isActive: self.$detailVM.isDealDetailsPartThreeValid)
            {
                Text("Next")
                    .padding()
                    .foregroundColor(.white)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .background(Color(Constants.Color.customDarkBlue))
                    .onTapGesture
                {
                    //Determine DealDetail Validity
                    
                    let isDealdetailValid = self.detailVM.isDealDetailsPartThreeComplete
                    
                    //Trigger Logic
                    if isDealdetailValid {
                        //Trigger NavigationLink
                        self.detailVM.isDealDetailsPartThreeValid = true
                        print(FileManager.default.urls(for: FileManager.SearchPathDirectory.documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask))
                    }
                    else {
                        self.detailVM.shouldShowDealDetailsAlert = true //trigger Alert
                    }
                }
            }
            .padding([.leading, .trailing], 15)
            
            .alert(isPresented: $detailVM.shouldShowDealDetailsAlert) {
                Alert(title: Text("Property Address is Mandatory"))
                
            }
        }
    }
}

struct DealDetailsView3_Previews: PreviewProvider {
    static var previews: some View {
        DealDetailsView3()
    }
}
