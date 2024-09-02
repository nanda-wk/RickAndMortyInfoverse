//
//  ContentView.swift
//  RickAndMortyInfoverse
//
//  Created by Nanda WK on 2024-08-10.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedTab: Tab = .character
    @State private var isTabBarHidden = false

    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                switch selectedTab {
                    case .character:
                        Characters(isTabBarHidden: $isTabBarHidden)
                    case .location:
                        Locations()
                    case .episode:
                        Episodes()
                }
    
                if !isTabBarHidden {
                    CustomTabBar(selectedTab: $selectedTab)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
