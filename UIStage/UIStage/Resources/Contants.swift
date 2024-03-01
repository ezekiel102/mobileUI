//
//  Contants.swift
//  UIStage
//
//  Created by Рустем on 29.02.2024.
//

import SwiftUI

enum views: View {

    case newsView
    case searchView
    case helpView
    case historyView
    case profileView

    var body: some View {
        switch self {
        case .newsView:
            NewsViewS().newsViewS
        case .searchView:
            SearchView()
        case .helpView:
            HelpView()
        case .historyView:
            HistoryView()
        case .profileView:
            ProfileView()
        }
    }
}

struct NewsViewS {

    let newsViewS = NewsView()


}
