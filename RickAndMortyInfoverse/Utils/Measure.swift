//
//  Measure.swift
//  RickAndMortyInfoverse
//
//  Created by Nanda WK on 2024-09-02.
//

import SwiftUI

struct SizeKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

struct MeasureModifier: ViewModifier {
    let fn: (CGFloat) -> Void

    func body(content: Content) -> some View {
        content
            .overlay {
                GeometryReader {
                    Color.clear
                        .preference(key: SizeKey.self, value: $0.frame(in: .global).minY)
                }
            }
            .onPreferenceChange(SizeKey.self, perform: fn)
    }
}

extension View {
    func measure(_ fn: @escaping (CGFloat) -> Void) -> some View {
        modifier(MeasureModifier(fn: fn))
    }
}
