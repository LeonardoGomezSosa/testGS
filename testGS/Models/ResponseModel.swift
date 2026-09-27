//
//  ResponseModel.swift
//  testGS
//
//  Created by Leonardo Gomez Sosa on 6/24/19.
//  Copyright © 2019 Leonardo Gomez Sosa. All rights reserved.
//

import Foundation

struct ResponseModel: Codable {
    let colors: [String]
    let questions: [Question]
}

struct Question: Codable {
    let text: String
    let total: Int
    let chartData: [ChartData]
}

struct ChartData: Codable {
    let text: String
    let percentage: Int

    // The service sends the misspelled key "percetnage"; accept the correct spelling too.
    private enum CodingKeys: String, CodingKey {
        case text
        case percentage
        case percetnage
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        text = try container.decode(String.self, forKey: .text)
        if let value = try container.decodeIfPresent(Int.self, forKey: .percetnage) {
            percentage = value
        } else {
            percentage = try container.decode(Int.self, forKey: .percentage)
        }
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(text, forKey: .text)
        try container.encode(percentage, forKey: .percetnage)
    }
}
