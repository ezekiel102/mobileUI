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
            VStack(alignment: .leading, spacing: 16) {
                Text("Спонсоры отремонтируют школу-интернат")
                    .font(.textStyle3)
                    .foregroundColor(.blueGrey)
                HStack(spacing: 10) {
                    Image("iconCal")
                    Text("Осталось 13 дней (21.09 – 20.10)")
                        .foregroundColor(.grey)
                        .font(.textStyle17)
                }
                Text("Благотворительный фонд «Счастливый Мир»")
                    .font(.textStyle12)
                    .foregroundColor(.charcoalGrey)
                HStack(spacing: 9) {
                    Image("iconNav")
                    Text("""
                         Санкт-Петербург, Кирочная улица,
                         д. 50А, каб. 208
                         """)
                    .foregroundColor(.charcoalGrey)
                        .font(.textStyle7)
                }
                HStack(spacing: 9) {
                    Image("iconPhone")
                    Text("""
                         +7 (937) 037 37-73
                         +7 (937) 016 16-16
                         """)
                    .foregroundColor(.charcoalGrey)
                        .font(.textStyle7)
                }
                HStack(spacing: 9) {
                    Image("mail")
                    Text("У вас есть вопросы?")
                        .foregroundColor(.charcoalGrey)
                        .font(.textStyle7)
                    Text("Напишите нам")
                        .foregroundColor(.leaf)
                        .font(.textStyle5)
                }
                HStack(spacing: 10) {
                    Image("image1")
                        .resizable()
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
                .frame(maxWidth: .infinity)
                Text("""
                        Участники и болельщики смогли весело и активно провести время на «Петербургском благотворительном марафоне» и при этом финансово поучаствовать в помощи детям.
                        """)
                .foregroundColor(.charcoalGrey)
                .font(.textStyle7)
                Text("""
                        При этом финансово поучаствовать в помощи детям. При этом финансово поучаствовать в помощи детям.
                        """)
                .foregroundColor(.charcoalGrey)
                .font(.textStyle7)
                Text("Перейти на сайт организаии")
                    .foregroundColor(.leaf)
                    .font(.textStyle5)
            }
            .frame(maxWidth: .infinity)
            .padding(20)
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
