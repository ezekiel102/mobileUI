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
        .overlay {
            NavigationBar(category: category, action: { dismiss() })
        }
        .navigationBarHidden(true)
    }
}

struct EView_Previews: PreviewProvider {
    static var previews: some View {
        EView(category: "Взрослые")
    }
}
