//
//  ModelSchemaV1.swift
//  SwiftDataMigrationTest
//
//  Created by Sean Conrad on 10/11/24.
//

import SwiftData

enum ModelSchemaV1: VersionedSchema {
    static var versionIdentifier: Schema.Version = Schema.Version(1, 0, 0)
    
    static var models: [any PersistentModel.Type] {
        [
            CarModel.self
        ]
    }
}
