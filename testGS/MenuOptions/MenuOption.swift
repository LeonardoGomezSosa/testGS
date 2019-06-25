//
//  MenuOption.swift
//  testGS
//
//  Created by Leonardo Gomez Sosa on 6/24/19.
//  Copyright © 2019 Leonardo Gomez Sosa. All rights reserved.
//

import UIKit

enum MenuOption: Int, CustomStringConvertible {
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
