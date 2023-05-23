//
//  LoadingView.swift
//  SimpleWeatherApp
//
//  Created by utku on 23.05.2023.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
            ProgressView()
            
        }
        .frame(maxWidth: 200, maxHeight: 200)
        .background(Color.gray.opacity(0.5))
        .foregroundColor(.white)
        .cornerRadius(10)
        .padding()
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
