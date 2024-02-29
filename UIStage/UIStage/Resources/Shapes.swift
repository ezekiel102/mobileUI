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

        path.move(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addQuadCurve(to: CGPoint(x: rect.maxX, y: rect.maxY),
                          control: CGPoint(x: rect.midX, y: -rect.maxY))

        return path
    }
}
