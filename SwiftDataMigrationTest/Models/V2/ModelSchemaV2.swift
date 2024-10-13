//
//  ModelSchemaV1.swift
//  SwiftDataMigrationTest
//
//  Created by Sean Conrad on 10/12/24.
//

import SwiftData

enum ModelSchemaV2: VersionedSchema {
    static var versionIdentifier: Schema.Version = Schema.Version(2, 0, 0)
    
    static var models: [any PersistentModel.Type] {
        [
            CarModel.self,
            CarManufacturer.self
        ]
    }
}
