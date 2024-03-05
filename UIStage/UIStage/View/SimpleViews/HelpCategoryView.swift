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
            Image(image)
            VStack {
                Spacer()
                Text(categoryName)
                    .font(.textStyle13)
                    .foregroundColor(.leaf)
                    .padding(.bottom, UICons.bottomPaddingText)
            }
        }
        .frame(width: UICons.categoryImageFrameWidth,
               height: UICons.categoryImageFrameHeight)
        .background(Color.lightGreyTwo)
    }
}

struct HelpCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        HelpCategoryView(image: "kids", categoryName: "Дети")
    }
}
