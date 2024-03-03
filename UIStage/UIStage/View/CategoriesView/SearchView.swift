//
//  SearchView.swift
//  UIStage
//
//  Created by Рустем on 29.02.2024.
//

import SwiftUI

struct SearchView: View {

    let viewModel: ViewModel

    var body: some View {
        NavigationStack {
            Color.green
                .overlay {
                    NavigationBar(category: viewModel.name, action: { exit(1) })
                }
                .navigationBarHidden(true)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(viewModel: ViewModel())
    }
}
