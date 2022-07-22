//
//  HomeView.swift
//  Real Estate App
//
//  Created by arifashraf on 06/01/22.
//
import SwiftUI

struct HomeView: View {
    
    @ObservedObject var homeVM = HomeViewModel()
    
    var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        
        ScrollView {
            
            HStack{
                
                Text("Existing Deals")
                    .font(.system(size: 20))
                    .foregroundColor(Color(Constants.Color.customDarkBlue))
                
                Text("Total \(homeVM.deals.count)")
                    .fontWeight(.bold)
                    .frame(minWidth: 0, maxWidth: 80, minHeight: 0, maxHeight: 30)
                    .background(Color(Constants.Color.customOrange))
                    .foregroundColor(Color.white)
                    .cornerRadius(20)
            }
            .padding()
            
            LazyVGrid(columns: gridItemLayout, spacing: 20) {
                
                ForEach(homeVM.deals, id: \.self) { deal in
                    
                    VStack {
                        
                        Image(systemName: "house")
                            .font(.system(size: 30))
                            .padding()
                            .foregroundColor(Color.init(uiColor: .black))
                        
                        Text(deal.fileNumber)
                            .font(.headline)
                            .foregroundColor(Color(Constants.Color.customDarkBlue))
                        
                        Text(deal.transactionType)
                            .frame(minWidth: 0, maxWidth: 100, minHeight: 0, maxHeight: 30)
                            .background(Color(UIColor.systemGray6))
                            .foregroundColor(Color(Constants.Color.customDarkBlue))
                            .cornerRadius(20)
                        
                        Text(deal.propertyAddress)
                            .padding([.horizontal], 10)
                            .truncationMode(.tail)
                            .font(.system(size: 15))
                            .frame(width: 180, height: 60, alignment: .top)
                            .lineLimit(4)
                            .foregroundColor(Color(Constants.Color.customDarkBlue))
                            .multilineTextAlignment(.center)
                        
                        NavigationLink(destination: {
                            ExistingDealDetailsView(deal: deal).onAppear {
                                
                                print(deal as Any)
                            }
                            
                        }, label: {
                            Text("OPEN")
                                .foregroundColor(Color(Constants.Color.customDarkBlue))
                                .frame(width: 100, height: 30, alignment: .center)
                                .background(Color.init(uiColor: UIKit.UIColor.systemGray4))
                                .cornerRadius(3)
                        })
                    }
                    .frame(minWidth: 180, maxWidth: 180, minHeight: 310, maxHeight: 310)
                    .background(.white)
                    .cornerRadius(10)
                    
                }
                .padding([.top, .bottom], 10)
                
            }
            .background(Color.init(uiColor: UIColor.systemGray5))
            
        }
        .navigationBarBackButtonHidden(true)
        
    }
    
}

struct HomeView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        HomeView()
        
    }
    
}
