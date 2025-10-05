//
//  MonitoringSetupView.swift
//  SwiftRockets
//
//  Created by Joao Roberto Fernandes Magalhaes on 05/10/25.
//

import SwiftUI

import SwiftUI

struct MonitoringSetupView: View {
    
    @State private var startDate = Date()
    @State private var endDate = Calendar.current.date(byAdding: .month, value: 1, to: Date()) ?? Date()
    @State private var selectedOptions: Set<MonitorOption.ID> = [.spot, .crewComfort] 

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Button {
                } label: {
                    HStack(spacing: 6) {
                        Image(systemName: "chevron.left")
                        Text("Voltar")
                    }
                }
                .font(.body)
                .foregroundStyle(.blue)
                .padding(.top, 8)

                Text("Qual período você deseja acompanhar?")
                    .font(.title3).bold()
                    .foregroundStyle(.primary)
                    .padding(.top, 4)

                // Data de início
                VStack(alignment: .leading, spacing: 8) {
                    Text("Data de início*")
                        .font(.subheadline).bold()
                    SRDateField(date: $startDate)
                }

                // Data final
                VStack(alignment: .leading, spacing: 8) {
                    Text("Data final")
                        .font(.subheadline).bold()
                    SRDateField(date: $endDate, minimumDate: startDate)
                }

                Text("O que deseja acompanhar?")
                    .font(.title3).bold()
                    .padding(.top, 8)

                OptionsGrid(selected: $selectedOptions)
                Color.clear.frame(height: 120)
            }
            .padding(.horizontal, 16)
            .padding(.top, 8)
        }
        .background(Color(.systemBackground))
        .safeAreaInset(edge: .bottom) {
            VStack {
                PrimaryButton("Continuar",
                              colors: isContinueEnabled ? [.yellowGradient, .orangeGradient] : [.gray.opacity(0.3), .gray.opacity(0.5)]) {
                    // ação: avançar pro próximo passo
                }
                .disabled(!isContinueEnabled)
                .frame(maxWidth: .infinity)
                .frame(height: 57)
                .padding(.horizontal, 16)
                .padding(.vertical, 12)
            }
            .background(.ultraThinMaterial) // leve blur atrás do botão
        }
    }

    private var isContinueEnabled: Bool {
        !selectedOptions.isEmpty && startDate <= endDate
    }
}

#Preview {
    MonitoringSetupView()
        .environment(\.locale, .init(identifier: "pt_BR"))
}

