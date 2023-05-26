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
    @State private var selectedCityId: Int?
    
    var body: some View {
        NavigationView {
            List {
                SearchBar(text: $searchText)
                ForEach(modelData.cities.filter { city in
                    searchText.isEmpty || city.name.localizedCaseInsensitiveContains(searchText)
                }) { city in
                    Button(action: {
                        selectedCityId = city.id
                        modelData.fetchWeatherById(id: city.id)
                    }) {
                        Text(city.name)
                    }
                }
            }
            .navigationTitle("Cities")
            .navigationBarTitleDisplayMode(.inline)
            // the problem was navigate the page without updating the city.
            .background(
                NavigationLink(
                    destination: WeatherPage(city: modelData.searchedCity ?? modelData.currentCity),
                    isActive: Binding(
                        get: { selectedCityId != nil && !modelData.isLoading },
                        set: { _ in }
                    ),
                    label: {
                        EmptyView()
                    }
                )
            )
        }
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
