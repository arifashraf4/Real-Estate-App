//
//  HomeView.swift
//  Real Estate App
//
//  Created by arifashraf on 14/12/21.
//
import SwiftUI
import CoreData

//enum DealType: Int, CaseIterable, Identifiable {
//
//    case purchase
//    case sale
//    case rent
//}
//
//extension DealType {
//
//    var id: UUID {
//        return UUID()
//    }
//
//    var name: String {
//        switch(self) {
//        case .purchase:
//            return "Purchase"
//        case .sale:
//            return "Sale"
//        case .rent:
//            return "Rent"
//        }
//    }
//}
//
//enum PaymentType: Int, CaseIterable, Identifiable {
//
//    case cash
//    case finance
//}
//
//extension PaymentType {
//
//    var id: UUID {
//        return UUID()
//    }
//
//    var name: String {
//        switch(self) {
//        case .cash:
//            return "Cash"
//        case .finance:
//            return "Finance"
//        }
//    }
//}


struct TabBarView: View {
    
    @ObservedObject var tabBarVM = TabBarViewModel()
    
    var body: some View {
        
        TabView(selection: $tabBarVM.selectedTab) {
            
            HomeView().navigationBarTitleDisplayMode(.inline)
                .tabItem {
                    
                    Label("Home", systemImage: Constants.TabBarItem.homeSymbol)
                        .background(.white)
                    
                }
                .tint(Color(Constants.Color.customDarkBlue))
                .tag(TabBarViewModel.Tabs.home)
            
            DealDetailsView().navigationBarTitleDisplayMode(.inline)
                .tabItem {
                    
                    Label("Create File", systemImage: Constants.TabBarItem.createFileSymbol)
                    
                }
                .tag(TabBarViewModel.Tabs.dealDetailsForm)
            
            MapContentView()
                .tabItem {
                    
                    Label("Map",systemImage: Constants.TabBarItem.mapSymbol)
                    
                }
                .tag(TabBarViewModel.Tabs.mapview)
            
        }
        .accentColor(Color(Constants.Color.customDarkBlue))
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(tabBarVM.selectedTab.rawValue.capitalized)
        .navigationBarBackButtonHidden(true)
        
        .toolbar {
            
            NavigationLink(destination: LoginView()
                            .navigationBarHidden(true)
                            .onAppear(perform: {
                LoggedInUser.shared.currentUser = nil
                UserDefaults.standard.set("", forKey: "email")
                UserDefaults.standard.set("", forKey: "password")
            }), label: {
                
                Text("Log Out")
                    .tint(Color(Constants.Color.customDarkBlue))
                
            })
            
        }
        
    }
    
}

struct TabBarView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        TabBarView()
            .previewDevice("iPhone 11")
        
    }
    
}



