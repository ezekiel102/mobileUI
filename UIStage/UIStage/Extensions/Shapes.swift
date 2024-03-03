//
//  Shapes.swift
//  UIStage
//
//  Created by Рустем on 29.02.2024.
//

import SwiftUI

struct Arc: Shape {

    let circleRadius: CGFloat = 27

    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addArc(center: CGPoint(x: rect.midX, y: 12),
                    radius: circleRadius,
                    startAngle: .degrees(0),
                    endAngle: .degrees(180),
                    clockwise: true)
        return path
    }
}

struct RectangleStroke: Shape {

    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.closeSubpath()
        return path
    }

}
