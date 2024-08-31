//
//  LocationCard.swift
//  RickAndMortyInfoverse
//
//  Created by Nanda WK on 2024-08-19.
//

import Foundation
import SwiftUI

struct LocationCard: View {
    
    let image: String
    let headerText: String
    let location: String
    
    var body: some View {
        ZStack {
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .offset(x: 0, y: -55)
            
            VStack {
                Text(headerText)
                    .font(.headline)
                    .foregroundStyle(Color.customBlack)
                
                Spacer()
                
                Text(location)
                    .font(.subheadline)
                    .foregroundStyle(Color.customPrimary)
                
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.customGray.opacity(0.05))
            .clipShape(RoundedRectangle(cornerRadius: 20))
        }
    }
}
