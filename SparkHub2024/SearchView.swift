import SwiftUI
import MapKit

struct SearchView: View {
    @State private var searchText = ""
    @State private var mapItems = [IdentifiableMKMapItem]()
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))

    var body: some View {
        VStack {
            SearchBar(text: $searchText, onSearchButtonClicked: search)
            Map(coordinateRegion: $region, annotationItems: mapItems) { item in
                MapPin(coordinate: item.mapItem.placemark.coordinate, tint: .red)
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
    
    private func search() {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchText
        
        let search = MKLocalSearch(request: request)
        search.start { response, error in
            guard let response = response else {
                print("Search error: \(String(describing: error))")
                return
            }
            
            mapItems = response.mapItems.map { IdentifiableMKMapItem(mapItem: $0) }
            if let firstItem = mapItems.first {
                region.center = firstItem.mapItem.placemark.coordinate
            }
        }
    }
}

struct IdentifiableMKMapItem: Identifiable {
    let id = UUID()
    let mapItem: MKMapItem
}

struct SearchBar: UIViewRepresentable {
    @Binding var text: String
    var onSearchButtonClicked: () -> Void

    class Coordinator: NSObject, UISearchBarDelegate {
        @Binding var text: String
        var onSearchButtonClicked: () -> Void

        init(text: Binding<String>, onSearchButtonClicked: @escaping () -> Void) {
            _text = text
            self.onSearchButtonClicked = onSearchButtonClicked
        }

        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
        }

        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            onSearchButtonClicked()
            searchBar.resignFirstResponder()
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(text: $text, onSearchButtonClicked: onSearchButtonClicked)
    }

    func makeUIView(context: Context) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        searchBar.placeholder = "Search for places"
        return searchBar
    }

    func updateUIView(_ uiView: UISearchBar, context: Context) {
        uiView.text = text
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
