//
//  MainView.swift
//  testGS
//
//  Created by Leonardo Gomez Sosa on 6/24/19.
//  Copyright © 2019 Leonardo Gomez Sosa. All rights reserved.
//

import SwiftUI

struct MainView: View {
    static let descriptionText = "Una gráfica o representación gráfica es un tipo de representación de datos, generalmente numéricos, mediante recursos visuales (líneas, vectores, superficies o símbolos), para que se manifieste visualmente la relación matemática o correlación estadística que guardan entre sí. También es el nombre de un conjunto de puntos que se plasman en coordenadas cartesianas y sirven para analizar el comportamiento de un proceso o un conjunto de elementos o signos que permiten la interpretación de un fenómeno. La representación gráfica permite establecer valores que no se han obtenido experimentalmente sino mediante la interpolación (lectura entre puntos) y la extrapolación (valores fuera del intervalo experimental)."

    @State private var title = ""

    var body: some View {
        NavigationStack {
            List {
                ForEach(MenuOption.allCases, id: \.self) { option in
                    switch option {
                    case .texto:
                        TextField(option.description, text: $title)
                    case .grafico:
                        NavigationLink {
                            ChartsView()
                        } label: {
                            Text(Self.descriptionText)
                        }
                    case .foto, .enviar:
                        Text(option.description)
                    }
                }
            }
            .navigationTitle("testGS")
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
