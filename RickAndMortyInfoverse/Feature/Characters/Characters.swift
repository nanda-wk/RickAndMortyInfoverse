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
                            NavigationLink(destination: CharacterDetail(character: character)) {
                                RMCharacterCard(character: character)
                            }
                        }
                    } else {
                        ProgressView()
                    }
                }
                .padding()
            }
            
        }
    }
}

#Preview {
    Characters()
}
