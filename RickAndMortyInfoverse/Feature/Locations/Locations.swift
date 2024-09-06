//
//  Locations.swift
//  RickAndMortyInfoverse
//
//  Created by Nanda WK on 2024-09-02.
//

import Kingfisher
import SwiftUI

struct Locations: View {
    
    @State private var vm = LocationsVM()
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(vm.dataTuple, id: \.location.id) { locationData in
                    NavigationLink{
                        LocationDetail(id: locationData.location.id)
                    } label: {
                        LocationRow(location: locationData.location, residents: locationData.residents)
                    }
                    .onAppear {
                        if locationData.location.id == vm.dataTuple.last?.location.id {
                            vm.loadLocations()
                        }
                    }
                }
                
                if vm.isLoading {
                    ProgressView()
                        .padding()
                }
            }
            .padding(.horizontal)
        }
        .navigationTitle("Locations")
        
    }
}

#Preview {
    Locations()
}

struct LocationRow: View {
    let location: RMLocation
    let residents: [URL]
    
    var body: some View {
        ZStack(alignment: .leading) {
            Image(.locationBG)
                .resizable()
                .scaledToFill()
                .frame(height: 120)
                .opacity(0.8)
            
            
            HStack( spacing: 40) {
                VStack(alignment: .leading) {
                    Text(location.name)
                        .font(.body)
                        .fontWeight(.bold)
                    
                    Text(location.type)
                        .font(.headline)
                }
                .foregroundStyle(.white)
                
                if !residents.isEmpty {
                    ZStack(alignment: .leading) {
                        ForEach(Array(residents.prefix(7).enumerated()), id: \.element) { index, character in
                            
                            KFImage(character)
                                .placeholder {
                                    ProgressView()
                                }
                                .resizable()
                                .loadDiskFileSynchronously()
                                .mask(Circle())
                                .frame(width: 40, height: 40)
                                .offset(x: CGFloat(index * 20))
                        }
                    }
                } else {
                    /*@START_MENU_TOKEN@*/EmptyView()/*@END_MENU_TOKEN@*/
                }
            }
            .padding(.horizontal)
        }
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}
