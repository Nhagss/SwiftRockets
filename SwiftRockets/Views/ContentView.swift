//
//  ContentView.swift
//  SwiftRockets
//
//  Created by Yago Souza Ramos on 10/4/25.
//

import SwiftUI
import MapKit
struct ContentView: View {
    @State var location: MKMapItem?
    @State private var showSearch = false

    var body: some View {
        NavigationStack {
            ZStack {
                MapView(location: $location)
                    .ignoresSafeArea()
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showSearch = true
                    } label: {
                        Label("Search", systemImage: "magnifyingglass")
                    }
                }
            }
            .sheet(isPresented: $showSearch) {
                NavigationStack {
                    MapSearchView(location: $location)
                        .navigationTitle("Search")
                        .toolbar {
                            ToolbarItem(placement: .topBarTrailing) {
                                Button("Done") { showSearch = false }
                            }
                        }
                }
            }
            .onChange(of: location, initial: false) { _, _ in
                if showSearch { showSearch = false }
            }
        }
    }
}

#Preview {
    ContentView()
}
