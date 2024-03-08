//
//  EView.swift
//  UIStage
//
//  Created by Рустем on 01.03.2024.
//

import SwiftUI

struct EventListView: View {

    @Environment(\.dismiss) var dismiss

    @State var isFinished: Bool = true

    var category: String
    var isClosed: Bool = true

    var body: some View {
        VStack(spacing: UICons.zeroSpacingForStack) {
            NavigationBar(category: category, action: { dismiss() })
                .overlay {
                    HStack {
                        Spacer()
                        Button {
                        } label: {
                            Image("filter")
                        }
                        .padding(.trailing, UICons.leadingPaddingBackButton)
                    }
                }
            header
            ZStack {
                Color.lightGrey
                ScrollView {
                    NavigationLink {
                        EventDetailsView()
                    } label: {
                        EventPreview()
                    }
                    NavigationLink {
                        EventDetailsView()
                    } label: {
                        EventPreview()
                    }
                }
                .padding(.top, UICons.topPaddingEventList)
            }
        }
        .toolbar(.hidden)
    }

    var header: some View {
        ZStack {
            HStack(
                alignment: .center,
                spacing: UICons.zeroSpacingForStack,
                content: {
                    Button {
                        isFinished ?
                        (isFinished = !isFinished) : (isFinished = isFinished)
                    } label: {
                        Text("Текущие")
                            .font(.textStyle9)
                            .foregroundColor(isFinished ? .leaf : .white)
                            .frame(maxWidth: .infinity,
                                   minHeight: UICons.calendarFrameHeight)
                    }
                    .background(!isFinished ? Color.leaf : .white)
                    Button {
                        isFinished ?
                        (isFinished = isFinished) : (isFinished = !isFinished)
                    } label: {
                        Text("Завершенные")
                            .font(.textStyle9)
                            .foregroundColor(!isFinished ? .leaf : .white)
                            .frame(maxWidth: .infinity,
                                   minHeight: UICons.calendarFrameHeight)
                    }
                    .background(isFinished ? Color.leaf : .white)
                })
            .border(Color.leaf, width: 1.0)
            .cornerRadius(4.0)
            .padding(.horizontal)
        }
        .frame(height: UICons.headerFrameHeight)
        .frame(maxWidth: .infinity)
        .shadow(color: .whiteThree, radius: 0.0, x: 0.0, y: 0.5)
        .background {
            Color.white
        }
    }
}

struct EView_Previews: PreviewProvider {
    static var previews: some View {
        EventListView(category: "Взрослые")
    }
}
