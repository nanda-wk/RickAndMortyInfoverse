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
    
    private var location: RMLocation {
        vm.location!
    }
    
    init(id: Int) {
        vm = LocationDetailVM(id: id)
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                CustomListItem(title: "Location Name", name: location.name)
                CustomListItem(title: "Type", name: location.type)
                CustomListItem(title: "Dimension", name: location.dimension)
                
                Text("Residents")
                    .font(.title)
                    .fontWeight(.bold)
                
                if !vm.isLoading {
                    LazyVGrid(columns: columns) {
                        ForEach(vm.characters) { character in
                            NavigationLink {
                                CharacterDetail(character: character)
                            } label: {
                                RMCharacterCard(character: character)
                            }
                        }
                        
                    }
                } else {
                    ProgressView()
                        .padding()
                }
            }
            .padding(.horizontal)
        }
        .navigationBarBackButtonHidden(true)
        .navigationTitle(location.name)
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
    LocationDetail(id: 1)
}
