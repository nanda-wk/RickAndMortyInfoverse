//
//  RMCharacterCard.swift
//  RickAndMortyInfoverse
//
//  Created by Nanda WK on 2024-08-11.
//

import Kingfisher
import SwiftUI

struct RMCharacterCard: View {
    
    let character: RMCharacter
    
    private var status: RMCharacterStatus {
        character.status
    }
    private var gender: RMCharacterGender {
        character.gender
    }
    
    private var url: URL {
        URL(string: character.image)!
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            KFImage(url)
                .placeholder {
                    ProgressView()
                }
                .loadDiskFileSynchronously()
                .resizable()
                .scaledToFit()
            
            VStack {
                HStack(alignment: .top) {
                    
                    Image(character.status.rawValue)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                    
                    Text(character.name)
                        .font(.subheadline)
                        .foregroundStyle(Color.customBlack)
                        .lineLimit(2, reservesSpace: true)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.bottom, 10)
            }
            .padding(.horizontal, 10)
        }
        .background()
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.statusColor(character.status))
        )
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: .statusColor(character.status).opacity(0.2), radius: 4)
        
    }
}

#Preview {
    RMCharacterCard(character: RMCharacter.dummy)
}
