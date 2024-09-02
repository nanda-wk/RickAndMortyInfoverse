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
            if vm.isLoading {
                ProgressView()
                    .padding()
            }
            
            LazyVGrid(columns: columns) {
                
                ForEach(vm.characters) { character in
                    NavigationLink {
                        CharacterDetail(character: character)
                    } label: {
                        RMCharacterCard(character: character)
                    }
                    .onAppear {
                        if character.id == vm.characters.last?.id {
                            vm.loadCharacters()
                        }
                    }
                }
                
            }
            .padding()
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
