//
//  PieChart.swift
//  testGS
//
//  Created by Leonardo Gomez Sosa on 6/24/19.
//  Copyright © 2019 Leonardo Gomez Sosa. All rights reserved.
//

import SwiftUI

// Swift Charts only has pie charts (SectorMark) from iOS 17, so the pie is drawn by hand for iOS 16.
struct PieChart: View {
    let slices: [ChartData]
    let hexColors: [String]

    private static let fallbackColors: [Color] = [.blue, .orange, .green, .red, .purple, .yellow, .pink, .teal]

    private var total: Double {
        slices.reduce(0) { $0 + Double($1.percentage) }
    }

    var body: some View {
        if total <= 0 {
            Text("No hay datos para la gráfica.")
                .foregroundColor(.secondary)
        } else {
            VStack(alignment: .leading, spacing: 12) {
                ZStack {
                    ForEach(Array(angles.enumerated()), id: \.offset) { index, range in
                        PieSlice(startAngle: range.start, endAngle: range.end)
                            .fill(color(at: index))
                    }
                }
                .aspectRatio(1, contentMode: .fit)
                .frame(maxWidth: 280)
                .frame(maxWidth: .infinity)

                ForEach(Array(slices.enumerated()), id: \.offset) { index, slice in
                    HStack {
                        Circle()
                            .fill(color(at: index))
                            .frame(width: 12, height: 12)
                        Text(slice.text)
                        Spacer()
                        Text("\(slice.percentage)%")
                            .foregroundColor(.secondary)
                    }
                    .font(.subheadline)
                }
            }
        }
    }

    private var angles: [(start: Angle, end: Angle)] {
        var start = Angle.degrees(-90)
        return slices.map { slice in
            let end = start + .degrees(360 * Double(slice.percentage) / total)
            defer { start = end }
            return (start, end)
        }
    }

    private func color(at index: Int) -> Color {
        if hexColors.isEmpty {
            return Self.fallbackColors[index % Self.fallbackColors.count]
        }
        return Color(hex: hexColors[index % hexColors.count])
    }
}

struct PieSlice: Shape {
    let startAngle: Angle
    let endAngle: Angle

    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        var path = Path()
        path.move(to: center)
        path.addArc(center: center, radius: min(rect.width, rect.height) / 2,
                    startAngle: startAngle, endAngle: endAngle, clockwise: false)
        path.closeSubpath()
        return path
    }
}
