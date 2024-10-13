//
//  CarModel.swift
//  SwiftDataMigrationTest
//
//  Created by Sean Conrad on 10/12/24.
//

import SwiftData

extension ModelSchemaV2 {
    @Model
    final class CarModel: Equatable {
        
        var modelName: String
        var numberOfDoors: Int
        var modelYear: Int
        var trimLevel: String
        @Attribute(.unique)
        var fullName: String
        
        var manufacturer: CarManufacturer?
        
        
        init(
            modelName: String,
            numberOfDoors: Int,
            modelYear: Int,
            trimLevel: String,
            manufacturer: String
        ) {
            self.modelName = modelName
            self.numberOfDoors = numberOfDoors
            self.modelYear = modelYear
            self.trimLevel = trimLevel
            self.manufacturer = CarManufacturer(name: manufacturer)
            
            self.fullName = "\(modelYear) \(modelName) \(trimLevel)"
        }
        
        init(
            modelName: String,
            numberOfDoors: Int,
            modelYear: Int,
            trimLevel: String,
            manufacturer: CarManufacturer? = nil
        ) {
            self.modelName = modelName
            self.numberOfDoors = numberOfDoors
            self.modelYear = modelYear
            self.trimLevel = trimLevel
            self.manufacturer = manufacturer
            
            self.fullName = "\(modelYear) \(modelName) \(trimLevel)"
        }
        
        init(from carModelV1: ModelSchemaV1.CarModel) {
            self.modelName = carModelV1.modelName
            self.numberOfDoors = carModelV1.numberOfDoors
            self.modelYear = carModelV1.modelYear
            self.trimLevel = carModelV1.trimLevel
            
            self.fullName = "\(carModelV1.modelYear) \(carModelV1.modelName) \(carModelV1.trimLevel)"
            
            self.manufacturer = nil
        }
    }
}
