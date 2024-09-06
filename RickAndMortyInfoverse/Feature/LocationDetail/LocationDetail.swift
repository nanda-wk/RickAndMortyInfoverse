//
//  LocationDetail.swift
//  RickAndMortyInfoverse
//
//  Created by Nanda WK on 2024-09-03.
//

import SwiftUI

struct LocationDetail: View {
    
    @Environment(\.dismiss) var dismiss
    
    let columns = [GridItem(.flexible(), spacing: 16), GridItem(.flexible())]
    
    @State var vm: LocationDetailVM
    
    init(location: RMLocation) {
        vm = LocationDetailVM(location: location)
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                CustomListItem(title: "Location Name", name: vm.location.name)
                CustomListItem(title: "Type", name: vm.location.type)
                CustomListItem(title: "Dimension", name: vm.location.dimension)
                
                if vm.isLoading {
                    ProgressView()
                        .padding()
                } else {
                    VStack(spacing: 10) {
                        Text(vm.characters.isEmpty ? "No Residents" : "Residents")
                            .font(.title)
                            .fontWeight(.bold)
                        
                        LazyVGrid(columns: columns) {
                            ForEach(vm.characters) { character in
                                NavigationLink {
                                    CharacterDetail(character: character)
                                } label: {
                                    RMCharacterCard(character: character)
                                }
                            }
                            
                        }
                    }
                }
            }
            .padding(.horizontal)
            .task {
                await vm.loadData()
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationTitle(vm.location.name)
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
    LocationDetail(location: RMLocation.dummy)
}
