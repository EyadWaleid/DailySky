//
//  ForecastDaysList.swift
//  DailySky
//
//  Created by Eyad waleed on 11/06/2026.
//

import SwiftUI

struct ForecastDaysList: View {
    var weatherData : WeatherUIModel
    var body: some View {
        Text("Forecast for 3-days")
            .font(.custom("SpaceGrotesk-Bold", size: 18))
            .frame(maxWidth: .infinity, alignment: .leading)
        List {
            ForEach(weatherData.forecasts) { item in
                NavigationLink(value: item) {
                    ForecastDayItem(forecastDayItem: item)
                }
                .listRowBackground(Color.clear)
                .listRowSeparator(.hidden)
                .listRowInsets(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
            }  .listStyle(.plain)
                .scrollDisabled(true)
                .frame(height: 350)
        }
    }
}

