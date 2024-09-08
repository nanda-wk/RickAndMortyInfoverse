//
//  Episodes.swift
//  RickAndMortyInfoverse
//
//  Created by Nanda WK on 2024-09-02.
//

import SwiftUI

struct Episodes: View {
    
    @Binding var isTabBarHidden: Bool
    
    @State private var vm = EpisodesVM()
    @State private var lastOffset: CGFloat = 0
    
    private let columns = [GridItem(.flexible(), spacing: 16), GridItem(.flexible(), spacing: 16)]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(vm.episodes, id: \.id) { episode in
                    NavigationLink {
                        EpisodeDetail(episode: episode)
                    } label: {
                        EpisodeCardView(episode: episode)
                    }
                    .task {
                        if episode == vm.episodes.last {
                            await vm.loadMoreData()
                        }
                    }
                }
            }
            .padding()
            .task {
                await vm.loadData()
            }
            .measure { newOffset in
                withAnimation(.easeOut.speed(1.5)){
                    if newOffset > lastOffset || newOffset > 0 {
                        isTabBarHidden = false
                    } else if newOffset < lastOffset {
                        isTabBarHidden = true
                    }
                }
                lastOffset = newOffset
            }
            
            if vm.isLoading {
                ProgressView()
                    .padding()
            }
        }
        .navigationTitle("Episodes")
        .searchable(text: $vm.searchName, prompt: "Episode Name")
    }
}

#Preview {
    Episodes(isTabBarHidden: .constant(false))
}
