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

    @State var isFinished: Bool = false
    @State var category: String
    @State var list: [Event] = []

    var body: some View {
        VStack(spacing: UICons.zeroSpacingForStack) {
            NavigationBar(title: category, action: { dismiss() })
                .overlay {
                    filterButton
                }
            header
            ZStack {
                Color.lightGrey
                ScrollView {
                    ForEach(list) { event in
                        NavigationLink {
                            EventDetailsView(event: event)
                        } label: {
                            EventPreview(event: event)
                        }
                    }
                }
                .padding(.top, UICons.topPaddingEventList)
                .onAppear {
                    list = viewModel.filterEventsList(isFinished: isFinished,
                                                      category: category)
                }
                .onChange(of: isFinished) { newValue in
                    list = viewModel.filterEventsList(isFinished: newValue,
                                                      category: category)
                }
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
                        list = viewModel.filterEventsList(isFinished: isFinished,
                                                          category: category)
                    } label: {
                        Text(item.name)
                    }
                }
            } label: {
                Image("filter")
            }
            .padding(.trailing, UICons.leadingPaddingLeftItemsNavBar)
        }
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
