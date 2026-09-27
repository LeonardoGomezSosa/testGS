//
//  ChartsView.swift
//  testGS
//
//  Created by Leonardo Gomez Sosa on 6/24/19.
//  Copyright © 2019 Leonardo Gomez Sosa. All rights reserved.
//

import SwiftUI

struct ChartsView: View {
    enum LoadState {
        case loading
        case loaded(ResponseModel)
        case failed(String)
    }

    @State private var state: LoadState = .loading

    var body: some View {
        Group {
            switch state {
            case .loading:
                ProgressView()
            case .failed(let message):
                VStack(spacing: 12) {
                    Text("No se pudieron cargar las preguntas.")
                    Text(message)
                        .font(.footnote)
                        .foregroundColor(.secondary)
                    Button("Reintentar") {
                        Task { await load() }
                    }
                }
                .padding()
            case .loaded(let response):
                List(Array(response.questions.enumerated()), id: \.offset) { _, question in
                    VStack(alignment: .leading, spacing: 12) {
                        Text(question.text)
                            .font(.headline)
                        PieChart(slices: question.chartData, hexColors: response.colors)
                    }
                    .padding(.vertical, 8)
                }
            }
        }
        .navigationTitle("Gráficas")
        .task {
            if case .loaded = state { return }
            await load()
        }
    }

    private func load() async {
        state = .loading
        do {
            state = .loaded(try await QuestionService.load())
        } catch {
            state = .failed(error.localizedDescription)
        }
    }
}
