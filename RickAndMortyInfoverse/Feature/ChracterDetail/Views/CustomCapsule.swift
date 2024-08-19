//
//  CustomCapsule.swift
//  RickAndMortyInfoverse
//
//  Created by Nanda WK on 2024-08-19.
//

import Foundation
import SwiftUI

struct CustomCapsule: View {
    
    var image: String
    let text: String
    let color: Color
    
    var body: some View {
        HStack(spacing: 8) {
            Image(image)
                .resizable()
                .frame(width: 24, height: 24)
            Text(text.capitalized)
                .font(.footnote)
                .foregroundStyle(color)
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 5)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(color, lineWidth: 2)
        )
    }
}
