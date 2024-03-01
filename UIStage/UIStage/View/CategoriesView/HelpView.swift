//
//  HelpView.swift
//  UIStage
//
//  Created by Рустем on 29.02.2024.
//

import SwiftUI

struct HelpView: View {

    let columns: [GridItem] = [
        GridItem(.fixed(174), spacing: 9, alignment: nil),
        GridItem(.fixed(174), spacing: 9, alignment: nil)
        ]

    private let images = ["kids", "adults", "grands", "pets", "events"]
    private let categoryName = ["Дети", "Взрослые", "Пожилые", "Животные", "Мероприятия"]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns,
                      spacing: 9,
                      pinnedViews: [.sectionHeaders],
                      content: {
                Section {
                    ForEach(0..<5) { item in
                        NavigationLink {
                            EView(category: categoryName[item])
                        } label: {
                            HelpCategoryView(image: images[item],
                                             categoryName: categoryName[item])
                            .frame(height: 160)
                        }
                    }
                } header: {
                    Text("Выберите категорию помощи")
                        .font(.textStyle2)
                        .frame(height: 36)
                }
            })
        }
    }
}

struct HelpView_Previews: PreviewProvider {
    static var previews: some View {
        HelpView()
    }
}
