//
//  QuestionService.swift
//  testGS
//
//  Created by Leonardo Gomez Sosa on 6/24/19.
//  Copyright © 2019 Leonardo Gomez Sosa. All rights reserved.
//

import Foundation

enum QuestionServiceError: LocalizedError {
    case badStatus(Int)

    var errorDescription: String? {
        switch self {
        case .badStatus(let code):
            return "El servidor respondió con el código \(code)."
        }
    }
}

enum QuestionService {
    static let url = URL(string: "https://us-central1-bibliotecadecontenido.cloudfunctions.net/helloWorld")!

    static func load() async throws -> ResponseModel {
        let (data, response) = try await URLSession.shared.data(from: url)
        if let http = response as? HTTPURLResponse, !(200..<300).contains(http.statusCode) {
            throw QuestionServiceError.badStatus(http.statusCode)
        }
        return try JSONDecoder().decode(ResponseModel.self, from: data)
    }
}
