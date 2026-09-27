//
//  QuestionService.swift
//  testGS
//
//  Created by Leonardo Gomez Sosa on 6/24/19.
//  Copyright © 2019 Leonardo Gomez Sosa. All rights reserved.
//

import Foundation

enum QuestionServiceError: Error {
    case invalidURL
    case badStatus(Int)
    case noData
}

func fetchQuestions(completion: @escaping (Result<ResponseModel, Error>) -> Void) {
    guard let url = URL(string: "https://us-central1-bibliotecadecontenido.cloudfunctions.net/helloWorld") else {
        completion(.failure(QuestionServiceError.invalidURL))
        return
    }
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        let result: Result<ResponseModel, Error>
        if let error = error {
            result = .failure(error)
        } else if let http = response as? HTTPURLResponse, !(200..<300).contains(http.statusCode) {
            result = .failure(QuestionServiceError.badStatus(http.statusCode))
        } else if let data = data {
            result = Result { try JSONDecoder().decode(ResponseModel.self, from: data) }
        } else {
            result = .failure(QuestionServiceError.noData)
        }
        DispatchQueue.main.async {
            completion(result)
        }
    }
    task.resume()
}
