//
//  SwiftUIView.swift
//  DailySky
//
//  Created by Eyad waleed on 11/06/2026.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        NavigationStack{
            TabView {
                HomeView()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                FavouriteView()
                    .tabItem {
                        Label("Favourites", systemImage: "heart")
                    }
            }.tint(.yellow)
                .onAppear {
                    let appearance = UITabBarAppearance()
                    appearance.configureWithTransparentBackground()
                    appearance.stackedLayoutAppearance.normal.iconColor = .gray
                    appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.gray]
                    appearance.stackedLayoutAppearance.selected.iconColor = .yellow
                    appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.yellow]
                    UITabBar.appearance().standardAppearance = appearance
                    UITabBar.appearance().scrollEdgeAppearance = appearance
                }
            
        }
    }}


