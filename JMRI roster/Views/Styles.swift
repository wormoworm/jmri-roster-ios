//
//  Styles.swift
//  JMRI roster
//
//  Created by Tom Homewood - Beam on 14/06/2021.
//

import Foundation
import SwiftUI

let colorPrimary = Color.init(hex: "FFF9062A")
let colorPrimaryDark = Color.init(hex: "FFBD0A24")
let colourWhite = Color.init(hex: "FFFFFFFF")
let colourLightGrey = Color.init(hex: "FFEEEEEE")
let colourLightMediumGrey = Color.init(hex: "FFCCCCCC")
let colourDarkGrey = Color.init(hex: "FF111111")
let colourBlack = Color.init(hex: "FF000000")

let fontTitle = Font.system(size: 20)
let fontBody1 = Font.system(size: 14)
let fontBody2 = Font.system(size: 14).weight(.semibold)

struct TextStyleListItemTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(fontTitle)
            .foregroundColor(colourBlack)
    }
}

struct TextStyleContentBlockTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(fontTitle)
            .foregroundColor(colorPrimaryDark)
            .padding(.bottom, 8)
    }
}

struct TextStyleField: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(fontBody2)
            .foregroundColor(.primary)
            .padding(.bottom, 8)
    }
}

struct TextStyleFieldLabel: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(fontBody1)
            .foregroundColor(.primary)
            .padding(.bottom, 2)
    }
}

struct StyleContentBlock: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(16)
            .background(colourLightGrey)
            .border(width: 1, edges: [.top, .bottom], color: colourLightMediumGrey)
    }
}

extension View {
    func style<Style: ViewModifier>(_ style: Style) -> some View {
        ModifiedContent(content: self, modifier: style)
    }
    
    func border(width: CGFloat, edges: [Edge], color: Color) -> some View {
        overlay(EdgeBorder(width: width, edges: edges).foregroundColor(color))
    }
}

struct EdgeBorder: Shape {

    var width: CGFloat
    var edges: [Edge]

    func path(in rect: CGRect) -> Path {
        var path = Path()
        for edge in edges {
            var x: CGFloat {
                switch edge {
                case .top, .bottom, .leading: return rect.minX
                case .trailing: return rect.maxX - width
                }
            }

            var y: CGFloat {
                switch edge {
                case .top, .leading, .trailing: return rect.minY
                case .bottom: return rect.maxY - width
                }
            }

            var w: CGFloat {
                switch edge {
                case .top, .bottom: return rect.width
                case .leading, .trailing: return self.width
                }
            }

            var h: CGFloat {
                switch edge {
                case .top, .bottom: return self.width
                case .leading, .trailing: return rect.height
                }
            }
            path.addPath(Path(CGRect(x: x, y: y, width: w, height: h)))
        }
        return path
    }
}

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
}
