//
//  ContentView.swift
//  SwiftDataMigrationTest
//
//  Created by Sean Conrad on 10/8/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query private var cars: [CarModel]
    
    @State var showModal: Bool = false
    @State var selectedCar: CarModel? = nil
    @State var newManufacturerName: String = ""
    
    var body: some View {
        Grid {
            Text("Cars:")
            List(cars) { car in
                //                ForEach(cars) { car in
                HStack {
                    Text(car.fullName)
                    if let manufacturerName = car.manufacturer?.name {
                        Text(manufacturerName)
                    }
                    
                }
                .onTapGesture {
                    selectedCar = car
                    showModal = true
                }
            }
//            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }
        }
        .onAppear {
            for carModel in CarSamples().samples {
                Task {
                    await SwiftDataManager.shared.insertNewCarModel(car: carModel)
                }
            }
        }
        .alert("Add Manufacturer", isPresented: $showModal) {
            TextField("Car Manufacturer", text: $newManufacturerName)
            Button("OK", action: {
                selectedCar?.manufacturer = CarManufacturer(name: newManufacturerName)
                
                selectedCar = nil
            })
        } message: {
            Text("Please enter Car Manufacturer")
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: CarModel.self, inMemory: true)
}
