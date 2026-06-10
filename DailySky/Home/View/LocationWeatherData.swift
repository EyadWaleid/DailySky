//
//  LocationWeatherData.swift
//  DailySky
//
//  Created by Eyad waleed on 05/06/2026.
//

import SwiftUI

struct LocationWeatherData: View {
    var body: some View {
            VStack{
                Text("San Francisco,CA ").font(.custom(
                    "SpaceGrotesk-Medium", size: 16 ))
                HStack{
                    Circle().foregroundStyle(.blue).frame(width:6, height: 6  )
                    
                    Text("My Location").font(.custom("SpaceGrotesk-Medium", size: 10 )).foregroundStyle(.gray)
              
                }
                Image("moon").resizable().frame(width: 150
                                                , height: 144)
                
                Text("72").font(.custom("SpaceGrotesk-Light", size: 96))
                Text("Mostly cloudy").font(.custom("SpaceGrotesk-Medium", size: 20))
                HStack{
                    Text("H:")
                    Text("78")
                    Text("L:")
                    Text("64")
                    
                    
                }
                
                
                RoundedRectangle(cornerRadius: 24)
                     .fill(.ultraThinMaterial)
                     .frame(minWidth: 342, maxWidth: .infinity,minHeight : 151).shadow(color: .black.opacity(0.25), radius:50,x:0,y:25).overlay {
                             LazyHStack(spacing: 30
                             ) {
                                 ForEach(1...4, id: \.self) { item in
                                     WeatherDataItem()
                                 }
                             
                         }
                     }
                Spacer().frame(height: 30)
                Text("Forecast for 3-days").font(.custom("SpaceGrotesk-Bold", size: 18)).frame(maxWidth: .infinity,alignment:.leading)
                List {
                    ForEach(1...3, id: \.self) { item in
                        ForecastDayItem().listRowBackground(Color.clear).listRowSeparator(.hidden).listRowInsets(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                    }
                    
                }.listStyle(.plain)
                .scrollDisabled(true)
                .frame(height: 350)
                

                
                
    
            }
      
      
    }
}

struct LocationWeatherData_Previews: PreviewProvider {
    static var previews: some View {
        LocationWeatherData()
        
    
    }
}
