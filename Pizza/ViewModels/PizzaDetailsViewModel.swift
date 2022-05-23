//
//  PizzaDetailsViewModel.swift
//  Pizza
//
//  Created by Chamath Peiris on 2022-05-12.
//

import Foundation

extension PizzaDetailsView {
    class ViewModel: ObservableObject {
        @Published var shouldShowAlert: Bool = false
        @Published var isFavorite: Bool = false
        
        //function for add pizzas to favourite list
        func addToFavorites(pizza: Pizza) {
            pizza.favorite = isFavorite
            PersistenceController.shared.saveContext()        }
    }
}
