//
//  CharacterDetail.swift
//  RickAndMortyInfoverse
//
//  Created by Nanda WK on 2024-08-13.
//

import Kingfisher
import SwiftUI

struct CharacterDetail: View {
    
    @Environment(\.dismiss) var dismiss
    
    let columns = [GridItem(.flexible(), spacing: 20), GridItem(.flexible(), spacing: 20)]
    
    @State var vm: CharacterDetailVM
    
    private var character: RMCharacter {
        vm.character
    }
    
    private var url: URL {
        URL(string: character.image)!
    }
    
    init(character: RMCharacter) {
        vm = CharacterDetailVM(character: character)
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                KFImage(url)
                    .placeholder {
                        Color.customGray.opacity(0.2)
                    }
                    .loadDiskFileSynchronously()
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .overlay(Button {
                        dismiss()
                    } label: {
                        BackButton()
                            .padding(.leading, 10)
                            .padding(.top, 50)
                    }, alignment: .topLeading)
                
                VStack {
                    Text(character.name)
                        .font(.title)
                        .fontWeight(.medium)
                    
                    HStack(spacing: 20) {
                        CustomCapsule(image: character.status.rawValue, text: character.status.rawValue, color: .statusColor(character.status), title: "Status")
                        
                        CustomCapsule(image: character.gender.rawValue, text: character.gender.rawValue, color: .genderColor(character.gender), title: "Gender")
                    }
                    
                    HStack(spacing: 20) {
                        CustomCapsule(image: "type", text: character.type.isEmpty ? "unknown" : character.type, color: .customPurple, title: "Type")
                        
                        CustomCapsule(image: "species", text: character.species, color: .customBlue, title: "Species")
                    }
                    .padding(.bottom, 40)
                    
                    HStack(spacing: 20) {
                        NavigationLink(value: character.origin) {
                            LocationCard(image: "planet", headerText: "Planet", location: character.origin.name)
                        }
                        
                        NavigationLink(value: character.location) {
                            LocationCard(image: "location", headerText: "Location", location: character.location.name)
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 20)
                
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(vm.episodes) { episode in
                        NavigationLink(value: episode) {
                            EpisodeCardView(episode: episode)
                        }
                    }
                }
                .padding(.horizontal, 20)
            }
            .padding(.bottom, 20)
            .navigationBarBackButtonHidden()
            .navigationDestination(for: Location.self) { origin in
                Text("Origin: \(origin.id)")
            }
            .navigationDestination(for: RMEpisode.self) { episode in
                Text("Episode: \(episode.id)")
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    CharacterDetail(character: RMCharacter.dummyCharacterDead)
}

//#Preview("Character Grid") {
//    Characters()
//}


