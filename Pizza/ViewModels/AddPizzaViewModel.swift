//
//  AddPizzaViewModel.swift
//  Pizza
//
//  Created by Chamath Peiris on 2022-05-12.
//

import Foundation

extension AddPizzaView {
    class ViewModel: ObservableObject {
        @Published var name: String = ""
        @Published var ingedients: String = ""
        @Published var imageName: String = ""
        @Published var selectedType = PizzaType.meat
        
        @Published var shouldShowAlert: Bool = false
        
        //function for save pizzas using data loader function
        func savePizza() {
            PersistenceController().addPizza(pizza: PizzaModel(
                id: UUID(),
                name: name,
                ingredients: ingedients,
                imageName: imageName.isEmpty ? "placeholder" : imageName,
                thumbnailName: imageName.isEmpty ? "placeholder" : imageName,
                type: selectedType.rawValue)
            )
        }
    }
}
