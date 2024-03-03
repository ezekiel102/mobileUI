//
//  NewsView.swift
//  UIStage
//
//  Created by Рустем on 29.02.2024.
//

import SwiftUI

struct NewsView: View {

    let viewModel: ViewModel

    var body: some View {
        NavigationStack {
            Color.blue
                .overlay {
                    NavigationBar(category: viewModel.name, action: { exit(1) })
                }
                .navigationBarHidden(true)
        }
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView(viewModel: ViewModel())
    }
}
