//
//  EventDetailsView.swift
//  UIStage
//
//  Created by Рустем on 05.03.2024.
//

import SwiftUI

struct EventDetailsView: View {
    var body: some View {
        VStack(spacing: UICons.zeroSpacingForVStack,
               content: {
            NavigationBar(category: "Спонсоры отремонитируют школу-интернат",
                          action: { print(1) })
                .overlay {
                    HStack {
                        Spacer()
                        Button {
                            print(2)
                        } label: {
                            Image("iconShare")
                        }
                        .padding(.trailing, UICons.leadingPaddingBackButton)
                    }
                }
            VStack {
                Text("Спонсоры отремонтируют школу-интернат")
            }
            HStack(spacing: 10) {
                Image("image1")
                    .scaledToFit()
                    .aspectRatio(CGFloat(222/168), contentMode: .fit)
                VStack(spacing: 10) {
                    Image("image2")
                        .resizable()
                        .scaledToFit()
                        .aspectRatio(CGFloat(103/79), contentMode: .fit)
                    Image("image3")
                        .resizable()
                        .scaledToFit()
                        .aspectRatio(CGFloat(103/79), contentMode: .fit)
                }
            }
            .padding(.horizontal, 20)
            HStack(spacing: 14) {
                Button {
                } label: {
                    VStack {
                        Image("shirt")
                        Text("Помочь вещами")
                            .foregroundColor(.warmGrey)
                    }
                }
                Divider()
                Button {
                } label: {
                    VStack {
                        Image("hands")
                        Text("Стать волонтером")
                            .foregroundColor(.warmGrey)
                    }
                }
                Divider()
                Button {
                } label: {
                    VStack {
                        Image("tools")
                        Text("Проф. помощь")
                            .foregroundColor(.warmGrey)
                    }
                }
                Divider()
                Button {
                } label: {
                    VStack {
                        Image("coins")
                        Text("Помочь деньгами")
                            .foregroundColor(.warmGrey)
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .frame(height: 69)
            .font(.textStyle16)
        })
    }
}

struct EventDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        EventDetailsView()
    }
}
