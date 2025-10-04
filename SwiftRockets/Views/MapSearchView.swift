//
//  MapSearchView.swift
//  SwiftRockets
//
//  Created by Yago Souza Ramos on 10/4/25.
//

import SwiftUI
import MapKit

struct MapSearchView: View {
    @State var searchQuery: String = ""
    @State var locationQueryResults: [MKMapItem] = []
    @Binding var location: MKMapItem?
    var body: some View {
        List {
            ForEach(locationQueryResults.indices, id: \.self) { index in
                let item = locationQueryResults[index]
                VStack(alignment: .leading, spacing: 2) {
                    Text(item.name ?? "Unknown location")
                        .font(.headline)
                    if let subtitle = item.address?.fullAddress {
                        Text(subtitle)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    location = item
                }
            }
        }
        .searchable(text: $searchQuery, placement: .automatic, prompt: "Search a place")
        .onChange(of: searchQuery, initial: false) { newValue, _ in
            Task {
                let items = await searchPlaces(query: newValue)
                await MainActor.run {
                    locationQueryResults = items
                }
                print("Results count: \(locationQueryResults.count)")
            }
        }
            
    }
}

func searchPlaces(query: String, region: MKCoordinateRegion? = nil) async -> [MKMapItem] {
    let request = MKLocalSearch.Request()
    request.naturalLanguageQuery = query
    if let region = region {
        request.region = region
    }

    let search = MKLocalSearch(request: request)
    guard let response = try? await search.start() else {
        print("Search error or no response.")
        return []
    }

    if response.mapItems.isEmpty {
        print("No results found.")
        return []
    }

    for item in response.mapItems.prefix(3) { // log a few for debugging
        print("Name: \(item.name ?? "Unknown")")
        print("Address: \(item.address?.fullAddress ?? "No address")")
        print("Coordinates: \(item.location.coordinate)\n")
    }
    return response.mapItems
}

#Preview {
    @Previewable @State var location: MKMapItem? = nil
    NavigationStack {
        MapSearchView(location: $location)
            
    }
}
