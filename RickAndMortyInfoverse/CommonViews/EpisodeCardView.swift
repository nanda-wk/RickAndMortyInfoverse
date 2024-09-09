//
//  EpisodeCardView.swift
//  RickAndMortyInfoverse
//
//  Created by Nanda WK on 2024-08-31.
//

import SwiftUI

struct EpisodeCardView: View {
    let episode: RMEpisode

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Episode \(episode.episode)")
                .font(.headline)
                .foregroundStyle(Color.customBlack)
                .multilineTextAlignment(.leading)

            Text(episode.name)
                .lineLimit(2, reservesSpace: true)
                .font(.headline)
                .foregroundStyle(Color.customBlack)
                .multilineTextAlignment(.leading)

            Text("Aired on \n\(episode.airDate)")
                .font(.subheadline)
                .foregroundStyle(Color.customBlack)
                .multilineTextAlignment(.leading)
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 10)
        .frame(maxWidth: .infinity)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.customBlack, lineWidth: 2)
        )
    }
}
