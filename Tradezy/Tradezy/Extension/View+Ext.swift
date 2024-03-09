//
//  View+Ext.swift
//  Tradezy
//

import SwiftUI

extension View {
    func hLeading() -> some View {
        frame(maxWidth: .infinity, alignment: .leading)
    }

    func hTrailing() -> some View {
        frame(maxWidth: .infinity, alignment: .trailing)
    }

    func hCenter() -> some View {
        frame(maxWidth: .infinity, alignment: .center)
    }
}

extension View {
    func vTop() -> some View {
        frame(maxHeight: .infinity, alignment: .top)
    }

    func vCenter() -> some View {
        frame(maxHeight: .infinity, alignment: .center)
    }

    func vBottom() -> some View {
        frame(maxHeight: .infinity, alignment: .bottom)
    }
}

extension View {
    func shineEffect(
        _ trigger: Bool,
        duration: CGFloat = 0.5,
        clipShape: some Shape = .rect(cornerRadius: 10),
        isRightToLeft: Bool = false
    ) -> some View {
        let gradient = LinearGradient(
            colors: [
                .clear,
                .clear,
                .white.opacity(0.1),
                .white.opacity(0.5),
                .white.opacity(1),
                .white.opacity(0.5),
                .white.opacity(0.1),
                .clear,
                .clear
            ],
            startPoint: .leading,
            endPoint: .trailing
        )

        return self
            .overlay {
                GeometryReader {
                    let size = $0.size
                    let modifiedDuration = max(0.5, duration)

                    Rectangle()
                        .fill(gradient)
                        .scaleEffect(y: 8)
                        .keyframeAnimator(initialValue: 0.0, trigger: trigger) { content, progress in
                            content
                                .offset(x: -size.width + (progress * size.width * 2))
                        } keyframes: { _ in
                            CubicKeyframe(0, duration: 0.1)
                            CubicKeyframe(1, duration: modifiedDuration)
                        }
                        .rotationEffect(.degrees(45))
                        .scaleEffect(x: isRightToLeft ? -1 : 1)
                }
            }
    }
}
