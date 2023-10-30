//
//  MarkerViews.swift
//  Hello Maps
//
//  Created by python on 30/10/23.
//

import SwiftUI
import MapKit

struct MarkerViews: View {
    var body: some View {
        Map{
            Marker("Coffee", coordinate: .coffee)
            Marker("Restaurant", coordinate: .restaurant)
        }
    }
}

#Preview {
    MarkerViews()
}
