//
//  CustomListItem.swift
//  RickAndMortyInfoverse
//
//  Created by Nanda WK on 2024-09-03.
//

import SwiftUI

struct CustomListItem: View {
    let title, name: String
    var body: some View {
        HStack {
            Text(title)
                .multilineTextAlignment(.leading)
            Spacer()
            Text(name)
                .multilineTextAlignment(.trailing)
        }
        .font(.title3)
        .fontWeight(.bold)
        .padding()
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.customGray.opacity(0.1))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.customBlack, lineWidth: 1)
        )
    }
}
