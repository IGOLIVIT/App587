//
//  AchievementsViewModel.swift
//  App587
//
//  Created by IGOR on 09/07/2024.
//

import SwiftUI

final class AchievementsViewModel: ObservableObject {

    @AppStorage("runs") var runs: Int = 0
    @AppStorage("awards") var awards: Int = 0
    @AppStorage("best") var best: String = ""
    @AppStorage("speed") var speed: String = ""

    @Published var addRuns = ""
    @Published var addAward = ""
    @Published var addBest = ""
    @Published var addSpeed = ""
    
    @Published var isAddAch: Bool = false
    
}
