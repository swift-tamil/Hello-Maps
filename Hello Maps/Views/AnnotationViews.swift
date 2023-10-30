//
//  AnnotationViews.swift
//  Hello Maps
//
//  Created by python on 30/10/23.
//

import SwiftUI
import MapKit

enum MapOptions: String, Identifiable, CaseIterable{
    
    case standard
    case hybrid
    case imagery
    
    var id: String{
        self.rawValue
    }
    
    var mapStyle: MapStyle{
        switch self{
        case .standard:
            return .standard
        case .hybrid:
            return .hybrid
        case .imagery:
            return .imagery
        }
    }
}

struct AnnotationViews: View {
    
    @State private var selectedMapOptions: MapOptions = .standard
    
    var body: some View {
        
        ZStack(alignment: .top) {
            Map{
                
                Annotation("Coffee",coordinate: .coffee){
                   Image(systemName: "cup.and.saucer.fill")
                        .padding(4)
                        .foregroundColor(.white)
                        .background(.indigo)
                        .cornerRadius(4.0)
                }
                
                Annotation("Restaurant",coordinate: .restaurant){
                   Image(systemName: "fork.knife.circle")
                }
                
            }//:MAP
            .mapStyle(selectedMapOptions.mapStyle)
            
            Picker("Map Styles", selection: $selectedMapOptions){
                
                ForEach(MapOptions.allCases){mapOptions in
                    Text(mapOptions.rawValue.capitalized).tag(mapOptions)
                }
            }
            .pickerStyle(.segmented)
            .background(.white)
            .padding()
        }
    }
}

#Preview {
    AnnotationViews()
}
