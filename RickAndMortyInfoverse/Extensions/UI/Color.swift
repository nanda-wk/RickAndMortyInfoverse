//
//  Color.swift
//  RickAndMortyInfoverse
//
//  Created by Nanda WK on 2024-08-11.
//

import SwiftUI

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
            case 3: // RGB (12-bit)
                (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
            case 6: // RGB (24-bit)
                (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
            case 8: // ARGB (32-bit)
                (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
            default:
                (a, r, g, b) = (1, 1, 1, 0)
        }
        
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
    
    static var customPrimary: Color {
        Color(hex: "11B0C8")
    }
    
    static var customSecondary: Color {
        Color(hex: "BFDE42")
    }
    
    static var customBlack: Color {
        Color(hex: "1A1A1A")
    }
    
    static var customBlack2: Color {
        Color(hex: "1E1E20")
    }
    
    static var customGray: Color {
        Color(hex: "313234")
    }
    
    static var customBlue: Color {
        Color(hex: "#2F4BFF")
    }
    
    static var customPurple: Color {
        Color(hex: "#ff79c6")
    }
    
    static func statusColor(_ status: RMCharacterStatus) -> Color {
        switch status {
            case .dead:
                return Color(hex: "e23636")
            case .alive:
                return .customSecondary
            case .unknown:
                return .customPrimary
        }
    }
    
    static func genderColor(_ gender: RMCharacterGender) -> Color {
        switch gender {
            case .male:
                Color(hex: "1070FF")
            case .female:
                Color(hex: "FF7596")
            case .genderless:
                Color(hex: "3CB371")
            case .unknown:
                .customGray
        }
    }
}
