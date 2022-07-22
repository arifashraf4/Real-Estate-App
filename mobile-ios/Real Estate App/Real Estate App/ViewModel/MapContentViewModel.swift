//
//  MapContentViewModel.swift
//  Real Estate App
//
//  Created by arifashraf on 03/02/22.
//
import SwiftUI
import MapKit

class MapContentViewModel: ObservableObject {
    
    @Published var mapView = MKMapView()
    @Published var mapType: MKMapType = .standard
    
    //Region
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.86434778035628, longitude: -77.83442296329797), span: MKCoordinateSpan(latitudeDelta: 0.004, longitudeDelta: 0.004))
}

