//
//  DateField.swift
//  SwiftRockets
//
//  Created by Joao Roberto Fernandes Magalhaes on 05/10/25.
//

import SwiftUI

struct SRDateField: View {
    @Binding var date: Date
    var minimumDate: Date? = nil

    var body: some View {
        HStack {
            DatePicker("", selection: $date,
                       in: (minimumDate ?? Date.distantPast)...Date.distantFuture,
                       displayedComponents: .date)
                .datePickerStyle(.compact)
                .labelsHidden()
                .tint(.primary)
                .padding(.horizontal, 12)
                .padding(.vertical, 10)
        }
        .frame(height: 44)
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(Color(.systemGray5))
        )
    }
}

#Preview {
    SRDateField(date: .constant(Date()))
}

