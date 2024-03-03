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
                .offset(x: 0, y: UICons.imageCategoryDeltaCenterY)
                .font(.textStyle13)
                .foregroundColor(.leaf)
        }
        .frame(width: UICons.categoryImageFrameWidth,
               height: UICons.categoryImageFrameHeight)
    }
}

struct HelpCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        HelpCategoryView(image: "kids", categoryName: "Дети")
    }
}
