//
//  Shapes.swift
//  UIStage
//
//  Created by Рустем on 29.02.2024.
//

import SwiftUI


struct blueArc: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        return path
    }


    let circleRadius: CGFloat = 27

    func shapePath(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.closeSubpath()
        return path
    }

    func circlePath(in rect: CGRect) -> Path {
        var path = Path()
        path.addArc(center: CGPoint(x: rect.midX, y: 12),
                    radius: circleRadius,
                    startAngle: .degrees(180.0),
                    endAngle: .degrees(0),
                    clockwise: true)
        return path
    }
}
