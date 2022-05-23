//
//  FavouriteViewModel.swift
//  Pizza
//
//  Created by Chamath Peiris on 2022-05-12.
//

import Foundation

extension FavouriteView {
    class ViewModel: ObservableObject {
        @Published var pizzas: [Pizza] = []
        
        // fetch all the favourite pizzas from data model
        func fetchAllData() {
            pizzas = PersistenceController.shared.fetchPizza().filter{ $0.favorite }
        }
    }
}
