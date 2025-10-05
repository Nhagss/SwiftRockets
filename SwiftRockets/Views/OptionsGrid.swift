//
//  OptionsGrid.swift
//  SwiftRockets
//
//  Created by Joao Roberto Fernandes Magalhaes on 05/10/25.
//

import SwiftUI

struct OptionsGrid: View {
    @Binding var selected: Set<MonitorOption.ID>

    private let columns = [GridItem(.flexible(), spacing: 12), GridItem(.flexible(), spacing: 12)]

    private let options: [MonitorOption] = [
        .init(id: .spot, title: "Escolher local de pesca", icon: "location.fill"),
        .init(id: .safety, title: "Identificar riscos de segurança", icon: "exclamationmark.triangle.fill"),
        .init(id: .planning, title: "Planejar horários de pesca", icon: "clock.fill"),
        .init(id: .crewComfort, title: "Conforto da triuplação", icon: "person.fill") // mantém a grafia do mock
    ]

    var body: some View {
        LazyVGrid(columns: columns, spacing: 12) {
            ForEach(options) { option in
                OptionTitle(
                    title: option.title,
                    icon: option.icon,
                    isSelected: selected.contains(option.id)
                )
                .onTapGesture {
                    if selected.contains(option.id) {
                        selected.remove(option.id)
                    } else {
                        selected.insert(option.id)
                    }
                }
            }
        }
    }
}

#Preview {
    StatefulPreviewWrapper(Set<MonitorOption.ID>([.spot])) { binding in
        OptionsGrid(selected: binding)
            .padding()
    }
}

/// Helper for previews to provide a Binding
struct StatefulPreviewWrapper<Value, Content: View>: View {
    @State var value: Value
    let content: (Binding<Value>) -> Content
    init(_ value: Value, content: @escaping (Binding<Value>) -> Content) {
        _value = State(initialValue: value)
        self.content = content
    }
    var body: some View { content($value) }
}
