//
//  EpisodeDetail.swift
//  RickAndMortyInfoverse
//
//  Created by Nanda WK on 2024-09-02.
//

import SwiftUI

struct EpisodeDetail: View {
    
    @Environment(\.dismiss) var dismiss
    @State var vm: EpisodeDetailVM
    
    private let columns = [GridItem(.flexible(), spacing: 16), GridItem(.flexible())]
    
    init(episode: RMEpisode) {
        vm = EpisodeDetailVM(episode: episode)
    }
    
    var body: some View {
        ScrollView {
            
            
            VStack(spacing: 20) {
                CustomListItem(title: "Title", name: vm.episode.name)
                CustomListItem(title: "Air Date", name: vm.episode.airDate)
                CustomListItem(title: "Episode", name: vm.episode.episode)
                
                Text("Characters")
                    .font(.title)
                    .fontWeight(.bold)
                
                if vm.isLoading {
                    ProgressView()
                        .padding()
                } else {
                    LazyVGrid(columns: columns) {
                        ForEach(vm.characters) { character in
                            NavigationLink {
                                CharacterDetail(character: character)
                            } label: {
                                RMCharacterCard(character: character)
                            }
                        }
                        
                    }
                }
            }
            .padding(.horizontal)
            .task {
                await vm.loadData()
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationTitle(vm.episode.episode)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss()
                } label: {
                    BackButton()
                }
            }
        }
    }
}

#Preview {
    EpisodeDetail(episode: RMEpisode.dummy)
}
