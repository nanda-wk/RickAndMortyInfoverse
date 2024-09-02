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

struct CustomListItem: View {
    let title, name: String
    var body: some View {
        HStack {
            Text(title)
                .multilineTextAlignment(.leading)
            Spacer()
            Text(name)
                .multilineTextAlignment(.trailing)
        }
        .font(.title3)
        .fontWeight(.bold)
        .padding()
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.customGray.opacity(0.1))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.customBlack, lineWidth: 1)
        )
    }
}
