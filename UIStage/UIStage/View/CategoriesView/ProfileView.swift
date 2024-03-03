//
//  ProfileView.swift
//  UIStage
//
//  Created by Рустем on 29.02.2024.
//

import SwiftUI

struct ProfileView: View {

    let viewModel: ViewModel

    var body: some View {
        NavigationStack {
            Color.purple
                .overlay {
                    NavigationBar(category: viewModel.name, action: { exit(1) })
                }
                .navigationBarHidden(true)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(viewModel: ViewModel())
    }
}
