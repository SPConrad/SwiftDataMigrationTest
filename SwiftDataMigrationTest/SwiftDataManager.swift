//
//  SwiftDataManager.swift
//  SwiftDataMigrationTest
//
//  Created by Sean Conrad on 10/8/24.
//

import Foundation
import SwiftData

typealias CarModel = ModelSchemaV2.CarModel
typealias CarManufacturer = ModelSchemaV2.CarManufacturer

struct ModelSchema {
    let schema = Schema([CarModel.self])
}

actor SwiftDataManager: ModelActor {
    
    nonisolated let modelExecutor: any ModelExecutor
    nonisolated let modelContainer: ModelContainer
    
    private var context: ModelContext { modelExecutor.modelContext }
    
    static let shared = SwiftDataManager()
    
    private init() {
        let config = ModelConfiguration(for: CarModel.self, CarManufacturer.self)
        do {
            self.modelContainer = try ModelContainer(
                for: CarModel.self, CarManufacturer.self,
                migrationPlan: ModelMigrationPlan.self,
                configurations: config)
            
            let context = ModelContext(modelContainer)
            modelExecutor = DefaultSerialModelExecutor(modelContext: context)
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    public func insert<T: PersistentModel>(data: T) {
        let context = data.modelContext ?? context
        context.insert(data)
    }
    
    public func fetchData<T: PersistentModel>(
        predicate: Predicate<T>? = nil,
        sortBy: [SortDescriptor<T>] = []
    ) throws -> [T] {
        let fetchDescriptor = FetchDescriptor<T>(
            predicate: predicate, sortBy: sortBy)
        let list: [T] = try context.fetch(fetchDescriptor)
        return list
    }

    public func fetchData<T: PersistentModel>(
        fetchDescriptor: FetchDescriptor<T>,
        sortBy: [SortDescriptor<T>] = []
    ) throws -> [T] {
        let list: [T] = try context.fetch(fetchDescriptor)
        return list
    }
    
    public func save() throws {
        do {
            try context.save()
        } catch {
            print(error)
        }
    }
    
    public func saveAndInsertIfNeeded<T: PersistentModel>(
        data: T,
        predicate: Predicate<T>
    ) throws {
        let descriptor = FetchDescriptor<T>(predicate: predicate)
        let context = data.modelContext ?? context
        let savedCount = try context.fetchCount(descriptor)

        if savedCount == 0 {
            context.insert(data)
        }
        do {
            try context.save()
        } catch {
            print(error)
        }
    }
    
    public func insertNewCarModel(car: CarModel) {
        do {
            try saveAndInsertIfNeeded(
                data: car, predicate: findCarModelPredicate(for: car))
        } catch {
            print(error)
        }
    }
    func findCarModelPredicate(for carModel: CarModel) -> Predicate<CarModel> {
        let modelName = carModel.modelName
        let numberOfDoors = carModel.numberOfDoors
        let modelYear = carModel.modelYear
        let trimLevel = carModel.trimLevel
        return #Predicate<CarModel> { findCar in
            findCar.modelName == modelName &&
            findCar.numberOfDoors == numberOfDoors &&
            findCar.modelYear == modelYear &&
            findCar.trimLevel == trimLevel
        }
    }
}
