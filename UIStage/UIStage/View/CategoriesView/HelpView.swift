//
//  HelpView.swift
//  UIStage
//
//  Created by Рустем on 29.02.2024.
//

import SwiftUI

struct HelpView: View {

    let helpTabBarView: TabBarNavigation = .news
    @ObservedObject var viewModel: ViewModel

    let columns: [GridItem] = [
        GridItem(.fixed(UICons.categoryImageFrameWidth),
                 spacing: UICons.lazyVGridColumnsSpacing,
                 alignment: nil),
        GridItem(.fixed(UICons.categoryImageFrameWidth),
                 spacing: UICons.lazyVGridColumnsSpacing,
                 alignment: nil)
        ]

    var body: some View {
        NavigationStack {
            VStack(
                spacing: UICons.zeroSpacingForVStack,
                content: {
                    NavigationBar(category: helpTabBarView.name, action: { exit(1) })
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
                    }
                })
        }
    }
}

struct HelpView_Previews: PreviewProvider {
    static var previews: some View {
        HelpView(viewModel: ViewModel())
    }
}
