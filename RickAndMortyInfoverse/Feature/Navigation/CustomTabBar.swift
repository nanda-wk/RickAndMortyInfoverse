//
//  CustomTabBar.swift
//  RickAndMortyInfoverse
//
//  Created by Nanda WK on 2024-09-02.
//

import SwiftUI

struct CustomTabBar: View {
    
    @Binding var selectedTab: Tab
    @State private var bounceTrigger: Tab?
    
    var body: some View {
        HStack {
            ForEach(Tab.allCases, id: \.self) { tab in
                Button {
                    withAnimation {
                        selectedTab = tab
                        bounceTrigger = tab
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        bounceTrigger = nil
                    }
                } label: {
                    Image(systemName: tab.rawValue)
                        .symbolEffect(.bounce, options: .speed(3), value: tab == bounceTrigger)
                        .frame(width: 40, height: 40)
                        .frame(maxWidth: .infinity)
                        .opacity(selectedTab == tab ? 1 : 0.5)
                        .background(
                            VStack {
                                RoundedRectangle(cornerRadius: 2)
                                    .frame(width: selectedTab == tab ? 20 : 0, height: 4)
                                    .offset(y: -4)
                                    .opacity(selectedTab == tab ? 1 : 0)
                                Spacer()
                            }
                        )
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding(12)
        .background(Color.customGray)
        .mask(RoundedRectangle(cornerRadius: 26, style: .continuous))
        .shadow(color: Color.customPrimary.opacity(0.3), radius: 20, x: 0, y: 20)
        .overlay(
            RoundedRectangle(cornerRadius: 26, style: .continuous)
                .stroke(.linearGradient(colors: [.white.opacity(0.5), .white.opacity(0)], startPoint: .topLeading, endPoint: .bottomTrailing))
        )
        .padding(.horizontal, 24)
        
    }
}

enum Tab: String, CaseIterable {
    case character = "person.2"
    case location = "globe"
    case episode = "play.tv"
}

#Preview {
    CustomTabBar(selectedTab: .constant(.character))
}

#Preview("content") {
    ContentView()
}
