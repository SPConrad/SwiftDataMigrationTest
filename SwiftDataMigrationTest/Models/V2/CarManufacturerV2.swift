//
//  CarManufacturerV2.swift
//  SwiftDataMigrationTest
//
//  Created by Sean Conrad on 10/12/24.
//

import SwiftData
extension ModelSchemaV2 {
    
    @Model
    final class CarManufacturer: Equatable {
        var name: String
        
        @Relationship(inverse:\CarModel.manufacturer)
        var carModels: [CarModel] = []
        
        init(name: String) {
            self.name = name
        }
    }
    
}
