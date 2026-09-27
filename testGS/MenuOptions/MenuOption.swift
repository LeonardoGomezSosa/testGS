//
//  MenuOption.swift
//  testGS
//
//  Created by Leonardo Gomez Sosa on 6/24/19.
//  Copyright © 2019 Leonardo Gomez Sosa. All rights reserved.
//

import SwiftUI

enum MenuOption: Int, CaseIterable, CustomStringConvertible {
    case texto
    case foto
    case grafico
    case enviar

    var description: String {
        switch self {

        case .texto:
            return "texto"
        case .foto:
            return "foto"
        case .grafico:
            return "grafico"
        case .enviar:
            return "enviar"
        }
    }
}

extension Color {
    init(hex: String) {
        let hexString = hex
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .trimmingCharacters(in: CharacterSet(charactersIn: "#"))
        let value = UInt64(hexString, radix: 16) ?? 0
        self.init(red: Double((value >> 16) & 0xFF) / 255,
                  green: Double((value >> 8) & 0xFF) / 255,
                  blue: Double(value & 0xFF) / 255)
    }
}
