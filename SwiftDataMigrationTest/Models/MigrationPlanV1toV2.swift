//
//  MigrationPlanV1toV2.swift
//  SwiftDataMigrationTest
//
//  Created by Sean Conrad on 10/12/24.
//

import SwiftData

enum ModelMigrationPlan: SchemaMigrationPlan {
    static var schemas: [any VersionedSchema.Type] {
        [ModelSchemaV1.self, ModelSchemaV2.self]
    }

    static var stages: [MigrationStage] {
        [migrateV1toV2]
    }

    static let migrateV1toV2 = MigrationStage.custom(
        fromVersion: ModelSchemaV1.self,
        toVersion: ModelSchemaV2.self,
        willMigrate: {context in
            let carModels = try context.fetch(FetchDescriptor<ModelSchemaV1.CarModel>())
            
            for carModelV1 in carModels {
                let newCarModel = ModelSchemaV2.CarModel(from: carModelV1)
                
                context.delete(carModelV1)
                context.insert(newCarModel)
            }
            
            try context.save()
        },
        didMigrate: nil
    )
}
