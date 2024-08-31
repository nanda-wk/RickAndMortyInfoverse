//
//  Characters.swift
//  RickAndMortyInfoverse
//
//  Created by Nanda WK on 2024-08-11.
//

import SwiftUI

struct Characters: View {
    @State private var vm = CharactersVM()
    
    var body: some View {
        let columns = [GridItem(.flexible(), spacing: 16), GridItem(.flexible())]
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    if !vm.isLoading {
                        ForEach(vm.characters) { character in
                            NavigationLink(value: character) {
                                RMCharacterCard(character: character)
                            }
                            .onAppear {
                                if character.id == vm.characters.last?.id {
                                    vm.loadCharacters()
                                }
                            }
                        }
                    } else {
                        ProgressView()
                            .padding()
                    }
                }
                .navigationDestination(for: RMCharacter.self) { character in
                    CharacterDetail(character: character)
                }
                .padding()
            }
            
        }
    }
}

#Preview {
    Characters()
}
