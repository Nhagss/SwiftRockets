import SwiftUI
import MapKit

struct MapView: View {
    private let appleParkCoordinate = CLLocationCoordinate2D(latitude: 37.3349, longitude: -122.00902)
    @Binding var location: MKMapItem?
    @State private var cameraPosition: MapCameraPosition = .automatic

    var body: some View {
        ZStack {
            Map(position: $cameraPosition) {
                if let item = location {
                    Marker(item.name ?? "Selected Location", coordinate: item.location.coordinate)
                }
                
            }
            
        }
        .ignoresSafeArea()
        
        .onChange(of: location, initial: false) { newValue, _ in
            guard let coord = newValue?.location.coordinate else { return }
            withAnimation(.easeInOut) {
                cameraPosition = .region(MKCoordinateRegion(center: coord,
                                                            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)))
            }
        }
        
        .onAppear {
            if let coord = location?.location.coordinate {
                cameraPosition = .region(MKCoordinateRegion(center: coord,
                                                            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)))
            } else {
                // Optionally set a default region (Apple Park)
                let coord = CLLocationCoordinate2D(latitude: 37.3349, longitude: -122.00902)
                cameraPosition = .region(MKCoordinateRegion(center: coord,
                                                            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)))
            }
        }
    }
}

#Preview {
    @Previewable @State var location: MKMapItem? = MKMapItem()
    MapView(location: $location)
}
