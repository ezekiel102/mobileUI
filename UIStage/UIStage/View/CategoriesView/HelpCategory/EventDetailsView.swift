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
                    subtitle
                    informationText
                    imageGroup
                    description
                    link
                }
                       .padding(.top, UICons.topPaddingScrollView)
                       .padding(.horizontal, UICons.horizontalPaddingScrollView)
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
                    } label: {
                        Image("iconShare")
                    }
                    .padding(.trailing, UICons.leadingPaddingLeftItemsNavBar)
                }
            }
    }

    var title: some View {
        Text(event.title)
            .font(.textStyle3)
            .foregroundColor(.blueGrey)
            .padding(.bottom, UICons.bottomPaddingTitle)
    }

    var subtitle: some View {
        VStack(alignment: .leading,
               spacing: UICons.subtitleVStackSpacing,
               content: {
            HStack(spacing: UICons.subtitleHStackSpacing) {
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
        .padding(.bottom, UICons.bottomPaddingSubTitle)
    }

    var informationText: some View {
        VStack(alignment: .leading,
               spacing: UICons.informationTextVStackSpacing,
               content: {
            HStack(spacing: UICons.informationTextHStackSpacings) {
                Image("iconNav")
                Text(event.location)
                .foregroundColor(.charcoalGrey)
                .font(.textStyle7)
            }
            HStack(alignment: .top, spacing: UICons.informationTextHStackSpacings) {
                Image("iconPhone")
                VStack(alignment: .leading) {
                    ForEach(event.contacts, id: \.self) {
                        Text($0)
                    }
                }
                .foregroundColor(.charcoalGrey)
                .font(.textStyle7)
            }
            HStack(spacing: UICons.informationTextHStackSpacings) {
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
        .padding(.bottom, UICons.bottomPaddingTextVStack)
    }

    var imageGroup: some View {
        HStack(spacing: UICons.imageFroupHorizontalSpacing) {
            Image(event.mainImage)
                .resizable()
                .scaledToFit()
                .aspectRatio(CGSize(width: 222, height: 168), contentMode: .fit)
            VStack(spacing: UICons.imageGroupVerticalSpacing) {
                ForEach(event.secondaryImage, id: \.self) {
                    Image($0)
                        .resizable()
                        .scaledToFit()
                        .aspectRatio(CGSize(width: 103, height: 79), contentMode: .fit)
                }
            }
        }
        .frame(height: UICons.imageGroupFrameHeight)
        .padding(.bottom, UICons.bottomPaddingImageGroup)
    }

    var description: some View {
        VStack(alignment: .leading, spacing: UICons.descriptionParagrahSpacing) {
            if let firstParagrah = firstParagrahSize(str: event.description),
                let lastParagrah = lastParagrahSize(str: event.description) {
                Text(firstParagrah)
                Text(lastParagrah)
                    .lineLimit(3)
                    .frame(height: UICons.lastParagrahHeight)
            } else {
                Text(event.description)
            }
        }
        .foregroundColor(.charcoalGrey)
        .font(.textStyle7)
        .padding(.bottom, UICons.bottomPaddingDescription)
    }

    var link: some View {
        Link(destination: event.link, label: {
            Text("Перейти на сайт организаии")
                .underline()
                .foregroundColor(.leaf)
                .font(.textStyle5)
        })
        .padding(.bottom, UICons.bottomLastParagrahPadding)
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
                .frame(height: UICons.avatarsFrameHeight)
                .padding(.vertical, 16)
                Text("+\(event.participants.count - 5)")
                    .font(.textStyle11)
                    .foregroundColor(.grey)
                    .padding(.leading, UICons.additionalCountLeadingPadding)
                Spacer()
            } else {
                ForEach(event.participants, id: \.self) {
                    Image($0.photo)
                        .resizable()
                        .scaledToFit()
                }
                .frame(height: UICons.avatarsFrameHeight)
                .padding(.vertical, 16)
                Spacer()
            }
        })
            .padding(.leading, UICons.avatarsStackLeadingPadding)
            .background(Color.lightGrey)
            .shadow(color: .black20, radius: 2.0, x: 0.0, y: 2.0)
    }

    func lastParagrahSize(str: String) -> String? {
        let font = UIFont.systemFont(ofSize: UICons.descriptionTextSize,
                                     weight: .regular)
        let fontAttribute = [NSAttributedString.Key.font: font]
        let size = str.size(withAttributes: fontAttribute)
        let count = CGFloat(str.count)
        let fontWidth = size.width / count
        let fontHeight = size.height
        let countOfLines = round(UICons.lastParagrahHeight / fontHeight)
        let charInLine = round((UIScreen.main.bounds.width - UICons.topPaddingScrollView) / fontWidth)
        let charInLastParagrah = charInLine * countOfLines
        for ind in (Int(count) - Int(charInLastParagrah) - 1)..<Int(count) {
            if str[str.index(str.startIndex, offsetBy: ind)] == "." {
                return "\(str[str.index(str.startIndex, offsetBy: ind + 2)...str.index(str.endIndex, offsetBy: -1)])"
            }
        }
        return nil
    }

    func firstParagrahSize(str: String) -> String? {
        let font = UIFont.systemFont(ofSize: UICons.descriptionTextSize,
                                     weight: .regular)
        let fontAttribute = [NSAttributedString.Key.font: font]
        let size = str.size(withAttributes: fontAttribute)
        let count = CGFloat(str.count)
        let fontWidth = size.width / count
        let fontHeight = size.height
        let countOfLines = round(UICons.lastParagrahHeight / fontHeight)
        let charInLine = round((UIScreen.main.bounds.width - UICons.topPaddingScrollView) / fontWidth)
        let charInLastParagrah = charInLine * countOfLines
        for ind in (Int(count) - Int(charInLastParagrah) - 1)..<Int(count) {
            if str[str.index(str.startIndex, offsetBy: ind)] == "." {
                return "\(str[str.startIndex...str.index(str.startIndex, offsetBy: ind)])"
            }
        }
        return nil
    }
}
