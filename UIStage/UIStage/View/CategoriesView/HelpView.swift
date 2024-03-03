//
//  HelpView.swift
//  UIStage
//
//  Created by Рустем on 29.02.2024.
//

import SwiftUI

struct HelpView: View {

    let viewModel: ViewModel

    let columns: [GridItem] = [
        GridItem(.fixed(UICons.categoryImageFrameWidth),
                 spacing: UICons.spacing,
                 alignment: nil),
        GridItem(.fixed(UICons.categoryImageFrameWidth),
                 spacing: UICons.spacing,
                 alignment: nil)
        ]

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns,
                          spacing: UICons.spacing,
                          pinnedViews: [.sectionHeaders],
                          content: {
                    Section {
                        ForEach(viewModel.categories) { category in
                            NavigationLink {
                                EView(category: category.name)
                            } label: {
                                HelpCategoryView(
                                    image: category.imageName,
                                    categoryName: category.name)
                                .frame(height: UICons.categoryImageFrameHeight)
                            }
                        }
                    } header: {
                        Text("Выберите категорию помощи")
                            .font(.textStyle2)
                            .frame(height: UICons.headerHeight)
                    }
                    .offset(x: 0, y: UICons.naviGationBarHeight)
                })
            }
            .overlay {
                NavigationBar(category: viewModel.name, action: { exit(1) })
            }
        }
    }
}

struct HelpView_Previews: PreviewProvider {
    static var previews: some View {
        HelpView(viewModel: ViewModel())
    }
}
