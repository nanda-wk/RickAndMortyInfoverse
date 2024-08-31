//
//  CustomCapsule.swift
//  RickAndMortyInfoverse
//
//  Created by Nanda WK on 2024-08-19.
//

import Foundation
import SwiftUI

struct CustomCapsule: View {
    
    let image: String
    let text: String
    let color: Color
    let title: String
    
    private let customShape = RoundedCorner(radius: 20, corners: [.bottomLeft, .bottomRight])
    
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 8) {
                Image(image)
                    .resizable()
                    .frame(width: 30, height: 30)
                Text(text.capitalized)
                    .font(.headline)
                    .lineLimit(2, reservesSpace: true)
            }
            .padding(.horizontal, 10)
            .padding(.top, 10)
            
            Text(title.uppercased())
                .font(.title3)
                .fontWeight(.bold)
                .foregroundStyle(color)
                .frame(maxWidth: .infinity)
                .background(Color.customGray.opacity(0.05))
                .clipShape(customShape)
            
        }
        .frame(maxWidth: .infinity)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(color, lineWidth: 2)
        )
    }
}

#Preview {
    CustomCapsule(image: "Dead", text: "Dead", color: Color.statusColor(.dead), title: "Status")
}
