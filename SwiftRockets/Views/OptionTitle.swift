//
//  OptionTitle.swift
//  SwiftRockets
//
//  Created by Joao Roberto Fernandes Magalhaes on 05/10/25.
//

import SwiftUI

struct OptionTitle: View {
    let title: String
    let icon: String
    let isSelected: Bool

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 14, style: .continuous)
                .fill(isSelected ? Color.selected : Color.unselected)

            VStack(alignment: .leading) {
                HStack {
                    Circle()
                        .strokeBorder(isSelected ? Color.blue.opacity(0.2) : Color(.systemGray3), lineWidth: 3)
                        .frame(width: 22, height: 22)
                        .overlay(
                            Image(systemName: "checkmark.circle.fill")
                                .font(.system(size: 22))
                                .foregroundStyle(isSelected ? .white : .clear)
                        )
                    Spacer()
                }

                Spacer()

                VStack(alignment: .center, spacing: 10) {
                    Image(systemName: icon)
                        .font(.system(size: 26, weight: .semibold))
                        .foregroundStyle(isSelected ? .white : .primary)

                    Text(title)
                        .font(.headline)
                        .foregroundStyle(isSelected ? .white : .primary)
                        .multilineTextAlignment(.leading)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(14)
        }
        .frame(height: 120)
        .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 2)
    }
}

#Preview {
    OptionTitle(title: "Exemplo", icon: "star.fill", isSelected: true)
        .padding()
}
