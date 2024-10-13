//
//  CarModel.swift
//  SwiftDataMigrationTest
//
//  Created by Sean Conrad on 10/8/24.
//

import SwiftData

extension ModelSchemaV1 {
    @Model
    final class CarModel: Equatable {

        var modelName: String
        var numberOfDoors: Int
        var modelYear: Int
        var trimLevel: String
        @Attribute(.unique)
        var fullName: String

        //        var manufacturer: String

        init(
            modelName: String,
            numberOfDoors: Int,
            modelYear: Int,
            trimLevel: String
            //            manufacturer: String
        ) {
            self.modelName = modelName
            self.numberOfDoors = numberOfDoors
            self.modelYear = modelYear
            self.trimLevel = trimLevel
            //            self.manufacturer = manufacturer

            self.fullName = "\(modelYear) \(modelName) \(trimLevel)"
        }
    }
}

struct CarSamples {
    let elantra = CarModel(
        modelName: "Elantra",
        numberOfDoors: 4,
        modelYear: 2024,
        trimLevel: "Blue",
        manufacturer: "Hyundai"
    )

    let mustang = CarModel(
        modelName: "Mustang",
        numberOfDoors: 2,
        modelYear: 2023,
        trimLevel: "GT",
        manufacturer: "Ford"
    )

    let civic = CarModel(
        modelName: "Civic",
        numberOfDoors: 4,
        modelYear: 2025,
        trimLevel: "DX",
        manufacturer: "Honda"
    )

    let veloster = CarModel(
        modelName: "Veloster",
        numberOfDoors: 3,
        modelYear: 2021,
        trimLevel: "EXT",
        manufacturer: "Hyundai")

    let corolla: CarModel = .init(
        modelName: "Corolla",
        numberOfDoors: 4,
        modelYear: 2015,
        trimLevel: "S",
        manufacturer: "Toyota")

    var samples: [CarModel] {
        [elantra, mustang, civic, veloster, corolla]
    }
}

//struct CarSamples {
//    let elantra = CarModel(
//        modelName: "Elantra",
//        numberOfDoors: 4,
//        modelYear: 2024,
//        trimLevel: "Blue"//,
////        manufacturer: "Hyundai"
//    )
//
//    let mustang = CarModel(
//        modelName: "Mustang",
//        numberOfDoors: 2,
//        modelYear: 2023,
//        trimLevel: "GT"//,
////        manufacturer: "Ford"
//    )
//
//    let civic = CarModel(
//        modelName: "Civic",
//        numberOfDoors: 4,
//        modelYear: 2025,
//        trimLevel: "DX"//,
////        manufacturer: "Honda"
//    )
//
//    let veloster = CarModel(
//        modelName: "Veloster",
//        numberOfDoors: 3,
//        modelYear: 2021,
//        trimLevel: "EXT"//,
////        manufacturer: "Hyundai"
//    )
//
//    let corolla: CarModel = .init(
//        modelName: "Corolla",
//        numberOfDoors: 4,
//        modelYear: 2015,
//        trimLevel: "S"//,
////        manufacturer: "Toyota"
//    )
//
//    var samples: [CarModel] {
//        [elantra, mustang, civic, veloster, corolla]
//    }
//}
