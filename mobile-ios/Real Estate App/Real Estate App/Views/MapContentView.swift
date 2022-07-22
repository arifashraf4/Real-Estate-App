//
//  MapContentView.swift
//  Real Estate App
//
//  Created by arifashraf on 03/02/22.
//

import SwiftUI
import MapKit

struct MapContentView: View {
    @StateObject var mapVM = MapContentViewModel()
    
    var body: some View {
        VStack {
            MapView(region: mapVM.region, mapType: mapVM.mapType)
                .edgesIgnoringSafeArea(.horizontal)
                .frame(width: 400, height: 550)
                .padding(.top, -50)
            
            Link("View Larger Map", destination: URL(string: "https://www.google.com/maps/place/Test+Track+Rd,+Benner+Township,+PA+16823,+USA/@40.864007,-77.835925,16z/data=!4m5!3m4!1s0x89cea41d7738a8a5:0x1352973cf8bfcc17!8m2!3d40.864007!4d-77.8359249?hl=en")!)
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding()
                .foregroundColor(Color.white)
                .background(Color(Constants.Color.customDarkBlue))
        }
        .padding()
    }
}

struct MapContentView_Previews: PreviewProvider {
    static var previews: some View {
        MapContentView()
    }
}
