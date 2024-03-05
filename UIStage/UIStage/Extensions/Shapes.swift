//
//  Shapes.swift
//  UIStage
//
//  Created by Рустем on 29.02.2024.
//

import SwiftUI

struct Arc: Shape {

    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY + UICons.helpButtonOffset),
                    radius: UICons.arcDiametr / 2,
                    startAngle: .degrees(0),
                    endAngle: .degrees(180),
                    clockwise: true)
        return path
    }
}
