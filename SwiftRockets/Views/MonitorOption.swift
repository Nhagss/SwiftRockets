//
//  MonitorOption.swift
//  SwiftRockets
//
//  Created by Joao Roberto Fernandes Magalhaes on 05/10/25.
//

import SwiftUI

struct MonitorOption: Identifiable {
    enum Kind: Hashable { case spot, safety, planning, crewComfort }
    let id: Kind
    let title: String
    let icon: String
}

