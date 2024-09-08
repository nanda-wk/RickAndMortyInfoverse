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
    @State var vm: CharacterDetailVM
    
    private let columns = [GridItem(.flexible(), spacing: 20), GridItem(.flexible(), spacing: 20)]
    
    init(character: RMCharacter) {
        vm = CharacterDetailVM(character: character)
    }
    
    var body: some View {
        ScrollView {
            VStack {
                KFImage(URL(string: vm.character.image))
                    .placeholder {
                        Color.customGray.opacity(0.2)
                    }
                    .loadDiskFileSynchronously()
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                
                VStack {
                    Text(vm.character.name)
                        .font(.title)
                        .fontWeight(.medium)
                        .measure { value in
                            withAnimation {
                                vm.showTitle = value < 0
                            }
                        }
                    
                    HStack(spacing: 20) {
                        CustomCapsule(image: vm.character.status.rawValue, text: vm.character.status.rawValue, color: .statusColor(vm.character.status), title: "Status")
                        
                        CustomCapsule(image: vm.character.gender.rawValue, text: vm.character.gender.rawValue, color: .genderColor(vm.character.gender), title: "Gender")
                    }
                    
                    HStack(spacing: 20) {
                        CustomCapsule(image: "type", text: vm.character.type.isEmpty ? "unknown" : vm.character.type, color: .customPurple, title: "Type")
                        
                        CustomCapsule(image: "species", text: vm.character.species, color: .customBlue, title: "Species")
                    }
                    .padding(.bottom, 40)
                    
                    HStack(spacing: 20) {
                        if !vm.character.origin.url.isEmpty, let origin = vm.origin {
                            NavigationLink {
                                LocationDetail(location: origin)
                            } label: {
                                LocationCard(image: "planet", headerText: "Planet", location: vm.character.origin.name)
                                    .task {
                                        await vm.fetchRelatedOrigin()
                                    }
                            }
                        } else {
                            LocationCard(image: "planet", headerText: "Planet", location: vm.character.origin.name)
                                .task {
                                    await vm.fetchRelatedOrigin()
                                }
                        }
                        
                        if !vm.character.location.url.isEmpty, let location = vm.location {
                            NavigationLink {
                                LocationDetail(location: location)
                            } label: {
                                LocationCard(image: "location", headerText: "Location", location: vm.character.location.name)
                                    .task {
                                        await vm.fetchRelatedLocation()
                                    }
                            }
                        } else {
                            LocationCard(image: "location", headerText: "Location", location: vm.character.location.name)
                                .task {
                                    await vm.fetchRelatedLocation()
                                }
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 20)
                
                if vm.isLoading {
                    ProgressView()
                        .padding()
                } else {
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
                }
            }
            .padding(.bottom, 20)
            .task {
                await vm.loadData()
            }
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden()
        .navigationTitle(vm.showTitle ? vm.character.name : "")
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
    CharacterDetail(character: RMCharacter.dummy)
}
