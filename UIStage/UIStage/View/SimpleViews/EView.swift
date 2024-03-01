//
//  EView.swift
//  UIStage
//
//  Created by Рустем on 01.03.2024.
//

import SwiftUI

struct EView: View {

    @Environment(\.dismiss) var dismiss
    var category: String

    var body: some View {
        ZStack {
            Color.orange
        }
        .safeAreaInset(edge: .top, content: {
            NavigationBar(category: category, action: { dismiss() })
                .frame(height: 36)
        })
        .navigationBarHidden(true)
    }
}

struct EView_Previews: PreviewProvider {
    static var previews: some View {
        EView(category: "Взрослые")
    }
}
