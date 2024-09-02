//
//  Characters.swift
//  RickAndMortyInfoverse
//
//  Created by Nanda WK on 2024-08-11.
//

import SwiftUI

struct Characters: View {
    
    @Binding var isTabBarHidden: Bool
    
    @State private var vm = CharactersVM()
    @State private var lastOffset: CGFloat = 0
    
    private let columns = [GridItem(.flexible(), spacing: 16), GridItem(.flexible())]
    
    var body: some View {
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
            .padding()
            .navigationDestination(for: RMCharacter.self) { character in
                CharacterDetail(character: character)
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
        }
        .navigationTitle("Characters")
    }
}

#Preview {
    Characters(isTabBarHidden: .constant(false))
}
