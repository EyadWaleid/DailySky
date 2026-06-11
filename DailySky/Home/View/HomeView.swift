//
//  HomeView.swift
//
//  Created by Eyad waleed on 05/06/2026.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var vm = DIContainer.shared.makeHomeViewModel()

    var body: some View {
      switch vm.state {
            case .loading:
                VStack {
                    ProgressView()
                    Text("Loading...")
                        .foregroundColor(.white)
                }
            case .success(let weather):
          NavigationStack{
              HomeBody(weather: weather , isDetail: false)
          }
            case .error(let message):
                VStack(spacing: 12) {
                    Image(systemName: "wifi.slash")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                    Text(message)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                    Button("Retry") {
                    }
                    .buttonStyle(.borderedProminent)
                }
                .padding()
            }
        }
    
}
