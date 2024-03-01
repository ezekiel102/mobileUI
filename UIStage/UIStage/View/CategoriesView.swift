//
//  CategoriesView.swift
//  UIStage
//
//  Created by Рустем on 29.02.2024.
//

import SwiftUI

struct CategoriesView: View {

    let category: String
    let view: views

    var body: some View {
        NavigationStack {
            view
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(Color.leaf,
                               for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        print(1)
                    }, label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                            .font(.system(size: 21))
                    })
                }
                ToolbarItem(placement: .principal) {
                    Text(category)
                        .font(.textStyle)
                        .foregroundColor(.white)
                }
            }
            .navigationBarHidden(true)
            .safeAreaInset(edge: .top, content: {
                NavigationBar(category: category, action: { print(1) })
                    .frame(height: 36)
            })
        }
    }

}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView(category: "Category", view: views.newsView)
    }
}
