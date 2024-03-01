//
//  HelpCategoryView.swift
//  UIStage
//
//  Created by Рустем on 29.02.2024.
//

import SwiftUI

struct HelpCategoryView: View {

    let image: String
    let categoryName: String

    var body: some View {
        ZStack {
            Color.lightGreyTwo
            Image(image)
                .offset(x: 0, y: 0)
            Text(categoryName)
                .offset(x: 0, y: 58)
                .font(.textStyle13)
                .foregroundColor(.leaf)
        }
            .frame(width: 174.0, height: 160.0)
    }
}

struct HelpCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        HelpCategoryView(image: "kids", categoryName: "Дети")
    }
}
