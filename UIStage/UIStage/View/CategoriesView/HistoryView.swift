//
//  HistoryView.swift
//  UIStage
//
//  Created by Рустем on 29.02.2024.
//

import SwiftUI

struct HistoryView: View {

    let viewModel: ViewModel

    var body: some View {
        NavigationStack {
            Color.yellow
                .overlay {
                    NavigationBar(category: viewModel.name, action: { exit(1) })
                }
                .navigationBarHidden(true)
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView(viewModel: ViewModel())
    }
}
