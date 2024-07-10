//
//  ParticipantsViewModel.swift
//  App587
//
//  Created by IGOR on 09/07/2024.
//

import SwiftUI
import CoreData

final class ParticipantsViewModel: ObservableObject {

    @Published var isAdd: Bool = false

    @Published var categories: [String] = ["Gregory", "Elite"]
    @Published var currentCat = "Gregory"
    
    @Published var photos: [String] = ["f1", "f2", "f3", "f4", "f5", "f6"]
    @Published var currentPhoto = ""
    
    @Published var parPhoto = ""
    @Published var parName = ""
    @Published var parAge = ""
    @Published var parClub = ""
    @Published var parCat = ""
    
    @Published var participants: [PartModel] = []
    @Published var selectedParticipant: PartModel?

    func addParticipant() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "PartModel", into: context) as! PartModel

        loan.parPhoto = parPhoto
        loan.parName = parName
        loan.parAge = parAge
        loan.parClub = parClub
        loan.parCat = parCat

        CoreDataStack.shared.saveContext()
    }

    func fetchParticipants() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<PartModel>(entityName: "PartModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.participants = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.participants = []
        }
    }
}
