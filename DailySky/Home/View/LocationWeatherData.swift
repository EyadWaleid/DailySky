//
//  LocationWeatherData.swift
//  DailySky
//
//  Created by Eyad waleed on 05/06/2026.
//

import SwiftUI

import SwiftUI

struct LocationWeatherData: View {
    let weatherData: WeatherUIModel

    var body: some View {
        VStack {
            Text(weatherData.country)
                .font(.custom("SpaceGrotesk-Medium", size: 16))
                .foregroundStyle(weatherData.isDay ? .black : .white)
            HStack {
                Circle().foregroundStyle(.blue).frame(width: 6, height: 6)
                Text("My Location")
                    .font(.custom("SpaceGrotesk-Medium", size: 10))
                    .foregroundStyle(.gray)
            }
            AsyncImage(url: URL(string: "https:" + weatherData.conditionIcon)) { image in
                image.resizable().frame(width: 150, height: 150)
            } placeholder: {
                ProgressView()
            }
            Text("\(weatherData.temperature) ")
                .font(.custom("SpaceGrotesk-Light", size: 96))
                .foregroundStyle(weatherData.isDay ? .black : .white)
            Text("\(weatherData.conditionText)")
                .font(.custom("SpaceGrotesk-Medium", size: 20))
                .foregroundStyle(weatherData.isDay ? .black : .white)
            HStack {
                Text("H:")
                Text("78")
                Text("L:")
                Text("64")
            }
            RoundedRectangle(cornerRadius: 24)
                .fill(.ultraThinMaterial).opacity(0.85)
                .frame(minWidth: 342, maxWidth: .infinity, minHeight: 151)
                .shadow(color: .black.opacity(0.25), radius: 50, x: 0, y: 25)
                .overlay {
                    LazyHStack(spacing: 30) {
                        WeatherDataItem(image: "wind", value: weatherData.wind, weatherItem: "Wind")
                        WeatherDataItem(image: "water.waves", value: weatherData.uv, weatherItem: "UV")
                        WeatherDataItem(image: "rectangle.compress.vertical", value: weatherData.pressure, weatherItem: "Pressure")
                        WeatherDataItem(image: "humidity", value: weatherData.humditiy, weatherItem: "humidity")
                    }
                }
            Spacer().frame(height: 30)
            if !weatherData.forecasts.isEmpty {
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
                    }
                }
                .listStyle(.plain)
                .scrollDisabled(true)
                .frame(height: 350)
            }
        }
        .navigationDestination(for: ForecastUIModel.self) { item in
            HomeBody(weather: WeatherUIModel(
                country: weatherData.country,
                temperature: item.temperature,
                conditionText: item.conditionText,
                conditionIcon: item.conditionIcon,
                humditiy: item.humditiy,
                wind: item.wind,
                pressure: item.pressure,
                uv: item.uv,
                isDay: weatherData.isDay,
                forecasts: []
            ),isDetail: true)
        }
    }
}
