//
//  ReportsViewModel.swift
//  App254
//
//  Created by Вячеслав on 11/10/23.
//

import SwiftUI

final class ReportsViewModel: ObservableObject {
    
    @AppStorage("reports") var reports: [String] = []
}
