//
//  Locations.swift
//  RickAndMortyInfoverse
//
//  Created by Nanda WK on 2024-09-02.
//

import Kingfisher
import SwiftUI

struct Locations: View {
    @Binding var isTabBarHidden: Bool

    @State private var vm = LocationsVM()
    @State private var lastOffset: CGFloat = 0

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 10) {
                ForEach(vm.locations, id: \.id) { location in
                    NavigationLink {
                        LocationDetail(location: location)
                    } label: {
                        LocationRow(location: location)
                    }
                    .task {
                        if location == vm.locations.last {
                            await vm.loadMoreData()
                        }
                    }
                }
            }
            .padding(.horizontal)
            .task {
                await vm.loadData()
            }
            .measure { newOffset in
                withAnimation(.easeOut.speed(1.5)) {
                    if newOffset > lastOffset || newOffset > 0 {
                        isTabBarHidden = false
                    } else if newOffset < lastOffset {
                        isTabBarHidden = true
                    }
                }
                lastOffset = newOffset
            }
            .searchable(text: $vm.searchName, prompt: "Location Name")

            if vm.isLoading {
                ProgressView()
                    .padding()
            }
        }
        .navigationTitle("Locations")
    }
}

#Preview {
    NavigationStack {
        Locations(isTabBarHidden: .constant(false))
    }
}

struct LocationRow: View {
    let location: RMLocation

    var body: some View {
        ZStack(alignment: .leading) {
            Image(.locationBG)
                .resizable()
                .scaledToFill()
                .frame(height: 120)

            VStack(alignment: .leading) {
                Text(location.name)
                    .font(.body)
                    .fontWeight(.bold)

                HStack {
                    if !location.type.isEmpty {
                        Text(location.type)
                    }

                    if !location.type.isEmpty, !location.dimension.isEmpty {
                        Text("•")
                            .font(.title)
                            .foregroundStyle(Color.customPrimary)
                    }

                    Text(location.dimension)
                }
                .font(.headline)
            }
            .foregroundStyle(.white)
            .multilineTextAlignment(.leading)
            .padding(.horizontal)
        }
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}
