//
//  HomeBody.swift
//  DailySky
//
//  Created by Eyad waleed on 11/06/2026.
//

import SwiftUI

struct HomeBody: View {
    let weather : WeatherUIModel
    var isDetail: Bool = false
    var body: some View {
        ZStack {
            Image(weather.isDay ? "morning" : "night")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            ScrollView {
                LocationWeatherData(weatherData: weather)
                    .padding(.horizontal, 24)
            }
        }
        .navigationBarBackButtonHidden(true)
        .toolbarBackground(.hidden, for: .navigationBar)
        .toolbar {
            if isDetail {
                ToolbarItem(placement: .navigationBarLeading) {
                    BackButton()
                }
            }
            
        }
    }}
    struct BackButton: View {
        @Environment(\.dismiss) private var dismiss
        
        var body: some View {
            Button {
                dismiss()
            } label: {
                HStack(spacing: 4) {
                    Image(systemName: "chevron.left")
                    Text("Home")
                }
                .foregroundStyle(.black)
                .font(.custom("SpaceGrotesk-Medium", size: 16))
            }
        }
    }
    
    

