//
//  HourItem.swift
//  DailySky
//
//  Created by Eyad waleed on 11/06/2026.
//

import SwiftUI

struct HourItem: View {
    var body: some View {
        VStack(spacing:12){
            Text("8 pm")
            Image("cloud.fill")
            Text("72")
        }.padding([.vertical , .horizontal] , 16).frame(width: 70 , height: 126).cornerRadius(999)
    }
}

struct HourItem_Previews: PreviewProvider {
    static var previews: some View {
        HourItem()
    }
}
