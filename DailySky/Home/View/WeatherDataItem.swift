//
//  WeatherDataItem.swift
//  DailySky
//
//  Created by Eyad waleed on 09/06/2026.
//

import SwiftUI

struct WeatherDataItem: View {
    var body: some View {
        VStack{
            ZStack{
                Circle()
                    .fill(Color.blue).opacity(0.2).frame(width: 40 , height: 40)
                
                Image(systemName: "cloud.rain.fill").resizable().foregroundColor(Color.blue).frame(width: 13,height: 13)
            }
            Text("Humidity").font(.custom("SpaceGrotesk-Bold", size: 10))
            Spacer().frame(height: 15)
            Text("45%")
        }
    }
}

struct WeatherDataItem_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDataItem()
    }
}
