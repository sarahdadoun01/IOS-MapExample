//
//  ContentView.swift
//  MapExample
//
//  Created by Sarah Dadoun on 2025-02-18.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 45.494183, longitude: -73.581283),
        span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
    )

    var body: some View {
        Map(coordinateRegion: $region, annotationItems: [Landmark(name: "College LaSalle", coordinate: region.center)]) { landmark in
            MapAnnotation(coordinate: landmark.coordinate) {
                VStack {
                    Image(systemName: "mappin.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.red)
                    Text(landmark.name)
                        .font(.caption)
                        .background(Color.white.opacity(0.7))
                        .cornerRadius(5)
                }
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

struct Landmark: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
