//
//  EpisodeDetail.swift
//  RickAndMortyInfoverse
//
//  Created by Nanda WK on 2024-09-02.
//

import SwiftUI

struct EpisodeDetail: View {
    
    @Environment(\.dismiss) var dismiss
    
    let columns = [GridItem(.flexible(), spacing: 16), GridItem(.flexible())]
    
    @State var vm: EpisodeDetailVM
    
    private var episode: RMEpisode {
        vm.episode
    }
    
    init(episode: RMEpisode) {
        vm = EpisodeDetailVM(episode: episode)
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                CustomListItem(title: "Title", name: episode.name)
                CustomListItem(title: "Air Date", name: episode.airDate)
                CustomListItem(title: "Episode", name: episode.episode)
                
                Text("Characters")
                    .font(.title)
                    .fontWeight(.bold)
                
                if !vm.isLoading {
                    LazyVGrid(columns: columns) {
                        ForEach(vm.characters) { character in
                            NavigationLink {
                                CharacterDetail(character: character)
                            } label: {
                                RMCharacterCard(character: character)
                            }
                        }
                        
                    }
                } else {
                    ProgressView()
                        .padding()
                }
            }
            .padding(.horizontal)
        }
        .navigationBarBackButtonHidden(true)
        .navigationTitle(episode.episode)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
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
    EpisodeDetail(episode: RMEpisode.dummyEpisode)
}
