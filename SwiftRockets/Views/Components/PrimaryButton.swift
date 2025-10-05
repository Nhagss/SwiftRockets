//
//  PrimaryButton.swift
//  SwiftRockets
//
//  Created by Joao Roberto Fernandes Magalhaes on 05/10/25.
//

import SwiftUI

struct PrimaryButton: View {
    private let title: String
    private let action: () -> Void
    private let colors: [Color]

    init(_ title: String, colors: [Color] = [.yellowGradient, .orangeGradient], action: @escaping () -> Void = {}) {
        self.title = title
        self.colors = colors
        self.action = action
    }

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundStyle(.black)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 14)
        }
        .buttonStyle(.plain)
        .contentShape(RoundedRectangle(cornerRadius: 200, style: .continuous))
        .background(
            RoundedRectangle(cornerRadius: 200, style: .continuous)
                .fill(LinearGradient(colors: colors, startPoint: .topLeading, endPoint: .bottomTrailing))
        )
        .clipShape(RoundedRectangle(cornerRadius: 200, style: .continuous))
        .shadow(color: .black.opacity(0.12), radius: 8, x: 0, y: 4)
        .accessibilityLabel(Text(title))
        .accessibilityAddTraits(.isButton)
    }
}

#Preview {
    VStack(spacing: 16) {
        PrimaryButton("Continuar") {}
    }
    .padding()
}
