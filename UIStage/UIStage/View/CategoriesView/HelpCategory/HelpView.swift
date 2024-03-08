//
//  HelpView.swift
//  UIStage
//
//  Created by Рустем on 29.02.2024.
//

import SwiftUI

struct HelpView: View {

    @EnvironmentObject var viewModel: ViewModel

    let helpTabBarView: MainTabBarNavigation = .help
    let columns: [GridItem] = [
        GridItem(.flexible(),
                 spacing: UICons.lazyVGridColumnsSpacing,
                 alignment: nil),
        GridItem(.flexible(),
                 spacing: UICons.lazyVGridColumnsSpacing,
                 alignment: nil)
    ]

    var body: some View {
        NavigationStack {
            VStack(
                spacing: UICons.zeroSpacingForStack,
                content: {
                    NavigationBar(title: helpTabBarView.name, action: { exit(1) })
                    ScrollView {
                        LazyVGrid(columns: columns,
                                  spacing: UICons.lazyVGridRowSpacing,
                                  pinnedViews: .sectionHeaders,
                                  content: {
                            Section {
                                ForEach(viewModel.categories) { category in
                                    NavigationLink {
                                        EventListView(category: category.name)
                                    } label: {
                                        HelpCategoryView(
                                            image: category.imageName,
                                            categoryName: category.name)
                                    }
                                }
                            } header: {
                                Text("Выберите категорию помощи")
                                    .font(.textStyle2)
                                    .padding(.top, UICons.topPaddingHeaderText)
                                    .padding(.bottom, UICons.bottomPaddingHeaderText)
                            }
                        })
                        .padding(.horizontal, UICons.lazyVGridRowSpacing)
                    }
                })
        }
    }
}

struct HelpView_Previews: PreviewProvider {

    static let viewModel = ViewModel()

    static var previews: some View {
        HelpView()
            .environmentObject(viewModel)
    }
}
