//
//  WeatherDataItem.swift
//  DailySky
//
//  Created by Eyad waleed on 09/06/2026.
//

import SwiftUI

struct WeatherDataItem: View {
    var image : String
    var value : String
    var weatherItem : String
    var body: some View {
        VStack{
            ZStack{
                Circle()
                    .fill(Color.blue).opacity(0.2).frame(width: 40 , height: 40)
                
                Image(systemName: image).resizable().foregroundColor(Color.blue).frame(width: 13,height: 13)
            }
            Text(weatherItem).font(.custom("SpaceGrotesk-Bold", size: 10))
            Spacer().frame(height: 15)
            Text(value)
        }
    }
}


