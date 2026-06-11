//
//  ForecastDayItem.swift
//  DailySky
//
//  Created by Eyad waleed on 09/06/2026.
//

import SwiftUI

struct ForecastDayItem: View {
    let forecastDayItem : ForecastUIModel
    var body: some View {
        HStack(spacing:  25){
            Text("\(forecastDayItem.day)").font(.custom("SpaceGrotesk-Medium", size:16 ))
            HStack(spacing:15){
                Image(systemName: "sun.min").resizable().foregroundStyle(Color.blue).frame(width: 22,height: 22)
                Text(forecastDayItem.conditionText  ).foregroundStyle(Color.gray)
            }
            
            HStack(spacing:10){
                Text("\(forecastDayItem.highTemp )").font(.custom("SpaceGrotesk-Bold", size:16 ))
                Text("\(forecastDayItem.lowTemp )").font(.custom("SpaceGrotesk-Bold", size:16 )).foregroundStyle(Color.gray)
            }
            
        }.padding(.horizontal, 20).frame( minWidth:342,maxWidth: .infinity, minHeight:80  ).background {
            RoundedRectangle(cornerRadius: 16)
                .fill(.ultraThinMaterial).opacity(0.9)
                .overlay {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.white.opacity(0.1))
                }.clipShape(RoundedRectangle(cornerRadius: 16)).shadow(radius:8)
            
        }
    }
    
    }
