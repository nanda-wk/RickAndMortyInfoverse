//
//  BackButton.swift
//  RickAndMortyInfoverse
//
//  Created by Nanda WK on 2024-08-19.
//

import SwiftUI

struct BackButton: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 40, height: 40)
                .foregroundStyle(.white)
                .opacity(0.8)
            
            Image(systemName: "chevron.left")
                .imageScale(.small)
                .frame(width: 44, height: 44)
                .foregroundStyle(.black)
        }
    }
}

#Preview {
    BackButton()
}
