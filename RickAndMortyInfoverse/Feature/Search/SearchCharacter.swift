//
//  SearchCharacter.swift
//  RickAndMortyInfoverse
//
//  Created by Nanda WK on 2024-09-08.
//

import SwiftUI

struct SearchCharacter: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var vm = SearchCharacterVM()
    
    private let columns = [GridItem(.flexible(), spacing: 16), GridItem(.flexible())]
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Character Name", text: $vm.searchName)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
            }
            .padding(.all, 10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.customGray.opacity(0.5))
            )
            
            Button {
                vm.isSheetPresented.toggle()
            } label: {
                HStack {
                    Text(vm.statusTitle)
                        .padding(.vertical, 4)
                        .frame(maxWidth: .infinity)
                        .background(Color.customGray.opacity(0.1))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    Text(vm.genderTitle)
                        .padding(.vertical, 4)
                        .frame(maxWidth: .infinity)
                        .background(Color.customGray.opacity(0.1))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
        }
        .padding(.horizontal)
        .padding(.top, 5)
        
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
            
            if vm.isLoading {
                ProgressView()
                    .padding()
            }
        }
        .navigationTitle("Search Character")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    BackButton()
                }
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    Task {
                        await vm.searchCharacter()
                    }
                } label: {
                    Text("Search")
                }
            }
        }
        .sheet(isPresented: $vm.isSheetPresented) {
            FilterView(status: $vm.status, gender: $vm.gender)
                .padding(.top, 10)
                .presentationDetents([.height(200)])
        }
    }
}

#Preview {
    NavigationStack {
        SearchCharacter()
    }
}
