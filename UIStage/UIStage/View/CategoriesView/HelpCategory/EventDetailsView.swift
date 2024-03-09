//
//  EventDetailsView.swift
//  UIStage
//
//  Created by Рустем on 05.03.2024.
//

import SwiftUI

struct EventDetailsView: View {

    @EnvironmentObject var viewCoordinator: ViewCoordinator
    @Environment(\.dismiss) var dismiss

    let event: Event

    var body: some View {
        VStack(alignment: .leading,
               spacing: UICons.zeroSpacingForStack,
               content: {
            navigationBar
            ScrollView {
                VStack(alignment: .leading,
                       spacing: UICons.zeroSpacingForStack) {
                    title
                        .padding(.bottom, UICons.bottomPaddingTitle)
                    subtitle
                        .padding(.bottom, UICons.bottomPaddingSubTitle)
                    textVStack
                        .padding(.bottom, UICons.bottomPaddingTextVStack)
                    imageGroup
                        .padding(.bottom, UICons.bottomPaddingImageGroup)
                    description
                        .padding(.bottom, UICons.bottomPaddingDescription)
                    link
                        .padding(.bottom, 32)
                }
                       .padding(.top, UICons.topHorizontalPadding)
                       .padding(.horizontal, UICons.topHorizontalPadding)
            }
            avatarsStack
        })
        .onAppear {
            viewCoordinator.currentTabBarView = .eventTabBarNavigation
        }
        .toolbar(.hidden)
    }
    var navigationBar: some View {
        NavigationBar(title: event.title,
                      action: {
            dismiss()
            viewCoordinator.currentTabBarView = .mainTabBarNavigation
        })
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
    }

    var title: some View {
        Text(event.title)
            .font(.textStyle3)
            .foregroundColor(.blueGrey)
    }

    var subtitle: some View {
        VStack(alignment: .leading,
               spacing: 10,
               content: {
            HStack(spacing: 10) {
                Image("iconCal")
                if event.isFinished {
                    Text("Событие закончилось")
                } else {
                    switch event.days {
                    case 1:
                        Text("Событие заканчивается завтра")
                    case 0:
                        Text("Событие заканчивается сегодня")
                    default:
                        Text("Осталось \(event.days) дней (\(event.dateInterval))")
                    }
                }
            }
            .foregroundColor(.grey)
            .font(.textStyle18)
            .lineLimit(1)
            Text(event.owner)
                .font(.textStyle12)
                .foregroundColor(.charcoalGrey)
        })
    }

    var textVStack: some View {
        VStack(alignment: .leading,
               spacing: 16,
               content: {
            HStack(spacing: 9) {
                Image("iconNav")
                Text(event.location)
                .foregroundColor(.charcoalGrey)
                .font(.textStyle7)
            }
            HStack(alignment: .top, spacing: 9) {
                Image("iconPhone")
                VStack(alignment: .leading) {
                    ForEach(0..<event.contacts.count) { item in
                        Text("\(event.contacts[item])")
                    }
                }
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
                    .underline()
            }
        })
    }

    var imageGroup: some View {
        HStack(spacing: 10) {
            Image(event.mainImage)
                .resizable()
                .scaledToFit()
            VStack(spacing: 10) {
                ForEach(0..<event.secondaryImage.count) { image in
                    Image(event.secondaryImage[image])
                        .resizable()
                        .scaledToFit()
                        .aspectRatio(CGFloat(103/79), contentMode: .fit)
                }
            }
            .fixedSize()
        }
        .frame(height: 168)
        .frame(maxWidth: .infinity)
    }

    var description: some View {
        VStack(alignment: .leading, spacing: 10) {
            if lastParagrahSize(str: event.description) != nil {
                Text(firstParagrahSize(str: event.description)!)
                Text(lastParagrahSize(str: event.description)!)
                    .lineLimit(3)
                    .frame(height: 60)
            } else {
                Text(event.description)
            }
        }
        .foregroundColor(.charcoalGrey)
        .font(.textStyle7)
        .multilineTextAlignment(.leading)
        .frame(maxWidth: .infinity)
    }

    var link: some View {
        Link(destination: event.link, label: {
            Text("Перейти на сайт организаии")
                .underline()
                .foregroundColor(.leaf)
                .font(.textStyle5)
        })
    }

    var avatarsStack: some View {
        HStack(alignment: .center,
               spacing: UICons.zeroSpacingForStack,
               content: {
            if event.participants.count > 5 {
                let lastParticipants = event.participants.reversed()[0...4]
                ForEach(lastParticipants, id: \.self) {
                    Image($0.photo)
                        .resizable()
                        .scaledToFit()
                }
                .frame(height: 36)
                Text("+\(event.participants.count - 5)")
                    .font(.textStyle11)
                    .foregroundColor(.grey)
                    .padding(.leading, 10)
                Spacer()
            } else {
                ForEach(event.participants, id: \.self) {
                    Image($0.photo)
                        .resizable()
                        .scaledToFit()
                }
                .frame(height: 36)
                Spacer()
            }
        })
            .padding(.leading, 20)
            .frame(maxWidth: .infinity)
            .frame(height: 68)
            .background(Color.lightGrey)
            .shadow(color: .black20, radius: 2.0, x: 0.0, y: 2.0)
    }

    func lastParagrahSize(str: String) -> String? {
        let font = UIFont.systemFont(ofSize: 15.0, weight: .regular)
        let fontAttribute = [NSAttributedString.Key.font: font]
        let size = str.size(withAttributes: fontAttribute)
        let count = CGFloat(str.count)
        let fontWidth = size.width / count
        let fontHeight = size.height
        let countOfLines = round(UICons.lastParagrahHeight / fontHeight)
        let charInLine = round((UIScreen.main.bounds.width - UICons.topHorizontalPadding) / fontWidth)
        let charInLastParagrah = charInLine * countOfLines
        for ind in (Int(count) - Int(charInLastParagrah) - 1)..<Int(count) {
            if str[str.index(str.startIndex, offsetBy: ind)] == "." {
                return "\(str[str.index(str.startIndex, offsetBy: ind + 2)...str.index(str.endIndex, offsetBy: -1)])"
            }
        }
        return nil
    }

    func firstParagrahSize(str: String) -> String? {
        let font = UIFont.systemFont(ofSize: 15.0, weight: .regular)
        let fontAttribute = [NSAttributedString.Key.font: font]
        let size = str.size(withAttributes: fontAttribute)
        let count = CGFloat(str.count)
        let fontWidth = size.width / count
        let fontHeight = size.height
        let countOfLines = round(UICons.lastParagrahHeight / fontHeight)
        let charInLine = round((UIScreen.main.bounds.width - UICons.topHorizontalPadding) / fontWidth)
        let charInLastParagrah = charInLine * countOfLines
        for ind in (Int(count) - Int(charInLastParagrah) - 1)..<Int(count) {
            if str[str.index(str.startIndex, offsetBy: ind)] == "." {
                return "\(str[str.startIndex...str.index(str.startIndex, offsetBy: ind)])"
            }
        }
        return nil
    }
}
