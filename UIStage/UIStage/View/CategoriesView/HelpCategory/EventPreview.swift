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
                .frame(height: 31.0)
            }
        }
        .background(.white)
        .cornerRadius(5.0)
        .shadow(color: .black20, radius: 2.0, x: 0.0, y: 1.0)
        .padding(.horizontal, 8)
        .frame(height: 413.0)
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
                .aspectRatio(CGFloat(113/20), contentMode: .fit)
                .padding(.horizontal, 123)
            Text(event.previewDescription)
                .font(.textStyle4)
                .multilineTextAlignment(.center)
                .foregroundColor(.darkSlateBlue)
        }
        .padding(.bottom, 16)
    }

    var calendar: some View {
        ZStack {
            Color.leaf
                .opacity(0.85)
            HStack {
                Image("shape")
                Text("Осталось \(event.days) дней (\(event.dateInterval))")
                    .foregroundColor(.white)
                    .font(.textStyle17)
            }
        }
    }
}

//struct EventPreview_Previews: PreviewProvider {
//    static var previews: some View {
//        EventPreview(event: Event)
//    }
//}
