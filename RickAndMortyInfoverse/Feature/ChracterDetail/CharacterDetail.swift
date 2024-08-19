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
    
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var vm: CharacterDetailVM
    
    private var character: RMCharacter {
        vm.character
    }
    
    private var url: URL {
        URL(string: character.image)!
    }
    
    init(character: RMCharacter) {
        self.vm = CharacterDetailVM(character: character)
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
                
                Group {
                    Text(character.name)
                        .font(.title)
                        .fontWeight(.medium)
                    
                    HStack(spacing: 20) {
                        CustomCapsule(image: character.status.rawValue, text: character.status.rawValue, color: .statusColor(character.status))
                        
                        CustomCapsule(image: "Dead", text: character.species, color: .customGray)
                        
                        CustomCapsule(image: character.gender.rawValue, text: RMCharacterGender.genderless.rawValue, color: .genderColor(character.gender))
                    }
                    .padding(.bottom, 40)
                    
                    
                    HStack(spacing: 20) {
                        LocationCard(image: "planet", headerText: "Planet", location: character.origin.name)
                        
                        LocationCard(image: "location", headerText: "Location", location: character.location.name)
                    }
                }
                .padding(.horizontal)
                LazyVGrid(columns: columns) {
                    ForEach(vm.episodes) { episode in
                        Text(episode.episode)
                            .padding(.horizontal)
                            .padding(.vertical, 10)
                            .background(Color.customPrimary)
                            .clipShape(RoundedRectangle(cornerRadius: 24))
                    }
                }
            }
            .navigationBarBackButtonHidden()
        }
        .ignoresSafeArea()
    }
}

#Preview {
    CharacterDetail(character: RMCharacter.dummyCharacterDead)
}

#Preview("Character Grid") {
    Characters()
}


