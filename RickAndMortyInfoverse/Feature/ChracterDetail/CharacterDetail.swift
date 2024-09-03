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
                
                VStack {
                    Text(character.name)
                        .font(.title)
                        .fontWeight(.medium)
                        .measure { value in
                            withAnimation {
                                vm.showTitle = value < 0
                            }
                        }
                    
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
                        if !character.origin.id.isEmpty {
                            NavigationLink {
                                LocationDetail(id: Int(character.origin.id)!)
                            } label: {
                                LocationCard(image: "planet", headerText: "Planet", location: character.origin.name)
                            }
                        } else {
                            LocationCard(image: "planet", headerText: "Planet", location: character.origin.name)
                        }
                        
                        if !character.location.id.isEmpty {
                            NavigationLink {
                                if !character.location.id.isEmpty {
                                    LocationDetail(id: Int(character.location.id)!)
                                }
                            } label: {
                                LocationCard(image: "location", headerText: "Location", location: character.location.name)
                            }
                        } else {
                            LocationCard(image: "location", headerText: "Location", location: character.location.name)
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 20)
                
                if !vm.isLoading {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(vm.episodes) { episode in
                            NavigationLink {
                                EpisodeDetail(episode: episode)
                            } label: {
                                EpisodeCardView(episode: episode)
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                } else {
                    
                    ProgressView()
                        .padding()
                    
                }
                
            }
            .padding(.bottom, 20)
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden()
        .navigationTitle(vm.showTitle ? character.name : "")
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
    CharacterDetail(character: RMCharacter.dummyCharacterDead)
}
