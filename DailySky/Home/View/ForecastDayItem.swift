//
//  ForecastDayItem.swift
//  DailySky
//
//  Created by Eyad waleed on 09/06/2026.
//

import SwiftUI

struct ForecastDayItem: View {
    var body: some View {
        HStack{
            Text("Tommorrow")
            Image(systemName: "sun.min").foregroundStyle(Color.blue)
            Text("clear sky")
            Text("78")
            Text("62")
        }
     
      }
}

struct ForecastDayItem_Previews: PreviewProvider {
    static var previews: some View {
        ForecastDayItem()
    }
}
