//
//  EView.swift
//  UIStage
//
//  Created by Рустем on 01.03.2024.
//

import SwiftUI

struct EventListView: View {

    @Environment(\.dismiss) var dismiss

    @EnvironmentObject var viewModel: ViewModel

    @State var isFinished: Bool = true
    @State var category: String

    var body: some View {
        VStack(spacing: UICons.zeroSpacingForStack) {
            NavigationBar(title: category, action: { dismiss() })
                .overlay {
                    filterButton
                }
            header
            ZStack {
                Color.lightGrey
                if isFinished {finishedBody} else {notFinishedBody}
            }
        }
        .toolbar(.hidden)
    }

    var filterButton: some View {
        HStack {
            Spacer()
            Menu {
                ForEach(viewModel.categories) { item in
                    Button {
                        category = item.name
                    } label: {
                        Text(item.name)
                    }
                }
            } label: {
                Image("filter")
            }
            .padding(.trailing, UICons.leadingPaddingBackButton)
        }
    }

    var notFinishedBody: some View {
        ScrollView {
            ForEach(viewModel.eventsList.filter {
                $0.category.name == category &&
                $0.currentDate <= $0.dateEnd
            }) { event in
                NavigationLink {
                    EventDetailsView(event: event)
                } label: {
                    EventPreview(event: event)
                }
            }
        }
        .padding(.top, UICons.topPaddingEventList)
    }

    var finishedBody: some View {
        ScrollView {
            ForEach(viewModel.eventsList.filter {
                $0.category.name == category &&
                $0.currentDate > $0.dateEnd
            }) { event in
                NavigationLink {
                    EventDetailsView(event: event)
                } label: {
                    EventPreview(event: event)
                }
            }
        }
        .padding(.top, UICons.topPaddingEventList)
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

    static let viewModel = ViewModel()

    static var previews: some View {
        EventListView(category: "Взрослые")
            .environmentObject(viewModel)
    }
}
