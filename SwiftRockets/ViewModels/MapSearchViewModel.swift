//
//  MapSearchViewModel.swift
//  SwiftRockets
//
//  Created by Yago Souza Ramos on 10/4/25.
//
import MapKit
final class MapViewModel {
    var location: [MKMapItem]
    
    init(location: [MKMapItem]) {
        self.location = location
    }
}
