//
//  HomeView.swift
//
//  Created by Eyad waleed on 05/06/2026.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Image("night")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            ScrollView {
                LocationWeatherData()
                    .padding(.horizontal, 24)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
