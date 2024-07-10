//
//  CompetitionsViewModel.swift
//  App587
//
//  Created by IGOR on 09/07/2024.
//

import SwiftUI
import CoreData

final class CompetitionsViewModel: ObservableObject {

    @Published var isAddComp: Bool = false
    @Published var isAdd: Bool = false

    @Published var tracks: [String] = ["raceq", "track"]
    @Published var currentTrack = ""
    
    @Published var racingTypes: [String] = ["Road Racing", "Track Racing", "Indoor Cycling"]
    @Published var currentType = ""
    
    @Published var comPhoto = ""
    @Published var comName = ""
    @Published var comDistance = ""
    @Published var comDate: Date = Date()
    @Published var comType = ""
    
    @Published var competitions: [CompModel] = []
    @Published var selectedCompetition: CompModel?

    func addCompetition() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "CompModel", into: context) as! CompModel

        loan.comPhoto = comPhoto
        loan.comName = comName
        loan.comDistance = comDistance
        loan.comDate = comDate
        loan.comType = comType

        CoreDataStack.shared.saveContext()
    }

    func fetchCompetitions() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<CompModel>(entityName: "CompModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.competitions = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.competitions = []
        }
    }
}
