//
//  CitySelection.swift
//  SimpleWeatherApp
//
//  Created by utku on 23.05.2023.
//

import SwiftUI

struct CitySelection: View {
    @EnvironmentObject var modelData: ModelData
    @State private var searchText = ""

    var body: some View {
        NavigationView {
            List {
                SearchBar(text: $searchText)
                ForEach(modelData.cities.filter { city in
                    searchText.isEmpty || city.name.localizedCaseInsensitiveContains(searchText)
                }) { city in
                    NavigationLink(destination: WeatherPage( city: city)) {
                        Text(city.name)
                    }
                    .onTapGesture {
                        modelData.currentCity = city
                    }
                }
            }
            
        }
        .navigationTitle("Cities")
        
    }
}

struct SearchBar: View {
    @Binding var text: String

    var body: some View {
        TextField("Search", text: $text)
            .padding(7)
            .background(Color(.systemGray6))
            .cornerRadius(8)
            .padding(.horizontal)
    }
}


struct CitySelection_Previews: PreviewProvider {
    static var previews: some View {
        CitySelection().environmentObject(ModelData())
    }
}
