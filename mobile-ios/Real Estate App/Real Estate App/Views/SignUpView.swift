//
//  SignUpView.swift
//  Real Estate App
//
//  Created by arifashraf on 14/12/21.
//

import SwiftUI
import Combine

struct SignUpView: View {
    
    @ObservedObject var signUpVM = SignUpViewModel.shared
    
    var body: some View {
        
        ScrollView {
            
            VStack {
                
                Text("Your Agency Details")
                    .padding()
                    .font(.system(size: 20, weight: .regular, design: .default))
                
                VStack {
                    
                    HStack {
                        
                        Text("Agency Name")
                            .foregroundColor(.gray)
                        Text("*")
                            .foregroundColor(.red)
                        
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    
                    TextField("Enter Agency Name", text: $signUpVM.agencyName)
                        .padding()
                        .overlay()
                    
                }
                
                VStack {
                    
                    HStack {
                        
                        Text("Agency Address")
                            .foregroundColor(.gray)
                        Text("*")
                            .foregroundColor(.red)
                        
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    
                    TextField("Enter Agency Street Address", text: $signUpVM.agencyAddress)
                        .padding()
                        .overlay()
                    
                }
                .padding(.top, 40)
                
                VStack {
                    
                    HStack {
                        
                        Text("City")
                            .foregroundColor(.gray)
                        Text("*")
                            .foregroundColor(.red)
                        
                        
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    
                    TextField("Select", text: $signUpVM.city)
                        .padding()
                        .overlay()
                    
                }
                .padding(.top, 40)
                
                VStack {
                    
                    HStack {
                        
                        Text("State")
                            .foregroundColor(.gray)
                        Text("*")
                            .foregroundColor(.red)
                        
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    
                    Picker(
                        selection: $signUpVM.selectedState,
                        label: Text(signUpVM.selectedState),
                        content: {
                            
                            ForEach(signUpVM.states, id: \.self) { option in
                                Text(option)
                                    .tag(option)
                            }
                        })
                        .pickerStyle(MenuPickerStyle())
                        .padding()
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .border(Color.gray)
                    
                }
                .padding(.top, 40)
                
                VStack {
                    
                    HStack {
                        
                        Text("Zip Code")
                            .foregroundColor(.gray)
                        Text("*")
                            .foregroundColor(.red)
                        
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    
                    TextField("XXXXXX", text: $signUpVM.zipCode)
                        .padding()
                        .overlay()
                        .keyboardType(.numberPad)
                        .onReceive(Just(self.signUpVM.zipCode)) {
                            
                            inputValue in
                            if inputValue.count > 6 {
                                
                                self.signUpVM.zipCode.removeLast()
                            }
                            
                        }
                    
                }
                .padding(.top, 40)
                
                HStack {
                    
                    VStack {
                        
                        HStack {
                            
                            Text("Business Type")
                                .foregroundColor(.gray)
                            Text("*")
                                .foregroundColor(.red)
                            
                        }
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        
                        Picker(
                            selection: $signUpVM.selectedBusinessType,
                            label: Text(signUpVM.selectedBusinessType),
                            content: {
                                
                                ForEach(signUpVM.businessType, id: \.self) { option in
                                    Text(option)
                                        .tag(option)
                                }
                                
                            })
                            .pickerStyle(MenuPickerStyle())
                            .padding()
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .border(Color.gray)
                        
                    }
                    .padding(.top, 40)
                    
                    VStack {
                        
                        HStack {
                            
                            Text("Deals Type")
                                .foregroundColor(.gray)
                            Text("*")
                                .foregroundColor(.red)
                            
                        }
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        
                        Picker(
                            selection: $signUpVM.selectedDealsType,
                            label: Text(signUpVM.selectedDealsType),
                            content: {
                                
                                ForEach(signUpVM.dealsType, id: \.self) { option in
                                    Text(option)
                                        .tag(option)
                                }
                                
                            })
                            .pickerStyle(MenuPickerStyle())
                            .padding()
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .border(Color.gray)
                        
                    }
                    .padding(.top, 40)
                    
                }
                
            }
            .padding()
            
            VStack {
                
                //                VStack {
                //                    HStack {
                //                        Text("Business Location")
                //                            .foregroundColor(.gray)
                //                        Text("*")
                //                            .foregroundColor(.red)
                //
                //                    }
                //
                //                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                //
                //
                //                    Picker(
                //                        selection: $signUpVM.selectedBusinessLocation,
                //                        label: Text(signUpVM.selectedBusinessLocation),
                //                        content: {
                //                            ForEach(signUpVM.businessLocation, id: \.self) { option in
                //                                Text(option)
                //                                    .tag(option)
                //                            }
                //                        })
                //                        .pickerStyle(MenuPickerStyle())
                //                        .padding()
                //                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                //                        .border(Color.gray)
                //                }
                //                .padding(.top, 40)
                
                //                VStack {
                //                    HStack {
                //                        Text("Dealing States")
                //                            .foregroundColor(.gray)
                //                        Text("*")
                //                            .foregroundColor(.red)
                //
                //                    }
                //
                //                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                //
                //                    Picker(
                //                        selection: $signUpVM.selectedDealingState,
                //                        label: Text(signUpVM.selectedDealingState),
                //                        content: {
                //                            ForEach(signUpVM.dealingStates, id: \.self) { option in
                //                                Text(option)
                //                                    .tag(option)
                //                            }
                //                        })
                //                        .pickerStyle(MenuPickerStyle())
                //                        .padding()
                //                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                //                        .border(Color.gray)
                //                }
                //                .padding(.top, 40)
                
                //                VStack {
                //                    HStack {
                //                        Text("Number of Employee")
                //                            .foregroundColor(.gray)
                //                        Text("*")
                //                            .foregroundColor(.red)
                //                    }
                //                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                ////
                //                    TextField("00", text: $signUpVM.numberOfEmployees)
                //                        .padding()
                //                        .overlay(RoundedRectangle(cornerRadius: 0)
                //                                    .stroke(lineWidth: 1)
                //                                    .foregroundColor(.gray))
                //                        .keyboardType(.numberPad)
                //                }
                //                .padding()
                
                //                Text("A little bit about yourself")
                //                    .padding()
                
                //                VStack {
                //                    VStack {
                //                        HStack {
                //                            Text("First Name")
                //                                .foregroundColor(.gray)
                //                            Text("*")
                //                                .foregroundColor(.red)
                //
                //                        }
                //
                //                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                
                //                        TextField("Enter First Name", text: $signUpVM.firstName)
                //                            .padding()
                //                            .overlay(RoundedRectangle(cornerRadius: 0)
                //                                        .stroke(lineWidth: 1)
                //                                        .foregroundColor(.gray))
                //                    }
                //
                //                    .padding()
                
                //                    VStack {
                //                        HStack {
                //                            Text("Last Name")
                //                                .foregroundColor(.gray)
                //                            Text("*")
                //                                .foregroundColor(.red)
                //
                //                        }
                //
                //                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                //
                //                        TextField("Enter Last Name", text: $signUpVM.lastName)
                //                            .padding()
                //                            .overlay(RoundedRectangle(cornerRadius: 0)
                //                                        .stroke(lineWidth: 1)
                //                                        .foregroundColor(.gray))
                //
                //                    }
                //                    .padding()
                
                //                }
                
                //                VStack {
                //                    HStack{
                //                        Text("Email")
                //                            .foregroundColor(.gray)
                //                        Text("*")
                //                            .foregroundColor(.red)
                //                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                //                    }
                //                    TextField("Enter Email Address", text: $signUpVM.email)
                //                        .padding()
                //                        .overlay(RoundedRectangle(cornerRadius: 0)
                //                                    .stroke(lineWidth: 1)
                //                                    .foregroundColor(.gray))
                //                        .textInputAutocapitalization(.never)
                //                }
                //                .padding()
                
                //                VStack {
                //
                //                    Text("Can we contact you?")
                //                        .foregroundColor(.gray)
                //                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                //
                //                    Picker("Select", selection: $signUpVM.selectedContactMe) {
                //                        ForEach(signUpVM.contactMe, id: \.self) {
                //                            Text($0)
                //                        }
                //                    }
                //                    .padding()
                //                    .frame(minWidth: 0, maxWidth: .infinity)
                //                    .border(Color.gray)
                //                    .foregroundColor(.gray)
                //                }
                //                .padding()
                
                //                Text("Please share contact person details")
                //                    .padding()
                //                    .foregroundColor(.secondary)
                //                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                
                VStack {
                    
                    NavigationLink(destination: SignUpView2(),
                                   isActive: self.$signUpVM.isSignUpPartOneValid) {
                        
                        Text("Next")
                            .padding()
                            .foregroundColor(.white)
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .background(Color(Constants.Color.customDarkBlue))
                            .onTapGesture {
                                
                                //Determine SignUp Validity
                                let isSignUpValid = self.signUpVM.isSignUpDetailsPartOneComplete && signUpVM.validateZipCode(zipCode: signUpVM.zipCode)
                                //Trigger Logic
                                if isSignUpValid {
                                    //Trigger NavigationLink
                                    self.signUpVM.isSignUpPartOneValid = true
                                }
                                else {
                                    self.signUpVM.shouldShowSignUpAlert = true
                                    
                                }
                            }
                        
                    }
                                   .padding([.leading, .trailing], 15)
                    
                                   .alert(isPresented: $signUpVM.shouldShowSignUpAlert) {
                                       
                                       if !signUpVM.isSignUpDetailsPartOneComplete {
                                           
                                           return Alert(title: Text("All fields are mandatory to fill"))
                                           
                                       }
                                       else if !signUpVM.validateZipCode(zipCode: signUpVM.zipCode) {
                                           
                                           return Alert(title: Text("Invalid ZipCode"))
                                           
                                       }
                                       return Alert(title: Text("All fields are mandatory to fill"))
                                       
                                   }
                    
                }
                
            }
            
        }
        .navigationBarTitle("Sign Up", displayMode: .inline)
        
    }
    
}

struct SignUpView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        SignUpView()
        
    }
    
}
