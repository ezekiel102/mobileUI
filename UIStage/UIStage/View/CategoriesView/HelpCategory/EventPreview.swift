//
//  EventPreview.swift
//  UIStage
//
//  Created by Рустем on 03.03.2024.
//

import SwiftUI

struct EventPreview: View {

    let event: Event

    var body: some View {
        ZStack {
            VStack(spacing: UICons.zeroSpacingForStack) {
                ZStack {
                    image
                    text
                }
                calendar
                    .frame(height: UICons.calendarBottomFrameHeight)
            }
        }
        .background(.white)
        .cornerRadius(5.0)
        .shadow(color: .black20, radius: 2.0, x: 0.0, y: 1.0)
        .padding(.horizontal, 8)
        .frame(height: UICons.previewFrameHeight)
    }

    var image: some View {
        ZStack {
            VStack {
                Image(event.previewImage)
                    .resizable()
                    .scaledToFit()
                    .padding(4)
                    .overlay {
                        RadialGradient(colors: [.clear, .white],
                                       center: .top,
                                       startRadius: 180,
                                       endRadius: 245)
                    }
                Spacer()
            }
        }
    }

    var text: some View {
        VStack {
            Spacer()
            Text(event.title)
                .font(.textStyle)
                .multilineTextAlignment(.center)
                .foregroundColor(.blueGrey)
            Image("heartinline")
                .resizable()
                .scaledToFit()
                .aspectRatio(UICons.imageAspectRatio, contentMode: .fit)
                .padding(.horizontal, UICons.heartHorizontalPadding)
            Text(event.previewDescription)
                .font(.textStyle4)
                .multilineTextAlignment(.center)
                .foregroundColor(.darkSlateBlue)
        }
        .padding(.bottom, UICons.textBottomPadding)
    }

    var calendar: some View {
        ZStack {
            Color.leaf
                .opacity(0.85)
            HStack {
                Image("shape")
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
            .foregroundColor(.white)
            .font(.textStyle17)
            .lineLimit(1)
        }
    }
}
