//
//  ForecastDayItem.swift
//  DailySky
//
//  Created by Eyad waleed on 09/06/2026.
//

import SwiftUI

struct ForecastDayItem: View {
    var body: some View {
        HStack(spacing:  25){
            Text("Tommorrow").font(.custom("SpaceGrotesk-Medium", size:16 ))
            HStack(spacing:15){
                Image(systemName: "sun.min").resizable().foregroundStyle(Color.blue).frame(width: 22,height: 22)
                Text("clear sky").foregroundStyle(Color.gray)
            }
            
            HStack(spacing:10){
                Text("78").font(.custom("SpaceGrotesk-Bold", size:16 ))
                Text("62").font(.custom("SpaceGrotesk-Bold", size:16 )).foregroundStyle(Color.gray)
            }
            
        }.padding(.horizontal, 20).frame( minWidth:342,maxWidth: .infinity, minHeight:80  ).background {
            RoundedRectangle(cornerRadius: 16)
                .fill(.ultraThinMaterial)
                .overlay {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.white.opacity(0.1))
                }.clipShape(RoundedRectangle(cornerRadius: 16)).shadow(radius:8)
            
        }
    }
    
    struct ForecastDayItem_Previews: PreviewProvider {
        static var previews: some View {
            ForecastDayItem()
        }
    }}
