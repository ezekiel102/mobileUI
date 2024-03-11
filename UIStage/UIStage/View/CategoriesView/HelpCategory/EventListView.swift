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
            Toggle(isOn: $isFinished) {}
                .toggleStyle(ToggleButtonsStyle())
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
}

struct ToggleButtonsStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack(spacing: 0) {
            Button {
                configuration.isOn = false
            } label: {
                Text("Текущие")
                    .foregroundColor(!configuration.isOn ? .white : Color.leaf)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .background(!configuration.isOn ? Color.leaf : .white)
            Button {
                configuration.isOn = true
            } label: {
                Text("Завершенные")
                    .foregroundColor(configuration.isOn ? .white : Color.leaf)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .background(configuration.isOn ? Color.leaf : .white)
        }
        .font(.textStyle9)
        .frame(height: UICons.toggleFrameHeight)
        .border(Color.leaf, width: 1.0)
        .cornerRadius(4.0)
        .padding(.vertical, 10)
        .padding(.horizontal, 16)
        .shadow(color: .whiteThree, radius: 0.0, x: 0.0, y: 0.5)
    }
}

struct EView_Previews: PreviewProvider {

    static let viewModel = ViewModel()

    static var previews: some View {
        EventListView(category: "Взрослые")
            .environmentObject(viewModel)
    }
}
