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
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(vm.characters, id: \.id) { character in
                    NavigationLink {
                        CharacterDetail(character: character)
                    } label: {
                        RMCharacterCard(character: character)
                    }
                    .task {
                        if character == vm.characters.last {
                            await vm.loadMoreData()
                        }
                    }
                }
                
            }
            .padding()
            .task {
                await vm.loadData()
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
            
            if vm.isLoading {
                ProgressView()
                    .padding()
            }
        }
        .navigationTitle("Characters")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink {
                    SearchCharacter()
                } label: {
                    Image(systemName: "magnifyingglass")
                }
                .foregroundStyle(Color.customPrimary)
            }
        }
    }
}

#Preview {
    NavigationStack {
        Characters(isTabBarHidden: .constant(false))
    }
}
