//
//  PizzaListViewModel.swift
//  Pizza
//
//  Created by Chamath Peiris on 2022-05-12.
//

import Foundation

extension PizzaListView {
    class ViewModel: ObservableObject {
        
        let coreDataManager: PersistenceController = PersistenceController.shared
        
        @Published var selectedValue = PizzaType.all
        @Published var showingSheet = false
        @Published var pizzas: [Pizza] = []
        
        init() {
            fetchAndFilterData()
        }
        
        //delete function using data loader function
        func delete(pizza: Pizza) {
            coreDataManager.deletePizza(pizza: pizza)
        }
        
        //function for fetch data and filter for each catogory using data loader funcions
        func fetchAndFilterData() {
            switch selectedValue {
            case .all:
                pizzas = coreDataManager.fetchPizza()
            case .meat:
                pizzas = coreDataManager.fetchPizza().filter{$0.type == "meat"}
            case .vegetarian:
                pizzas = coreDataManager.fetchPizza().filter{$0.type == "veggie"}
            }
        }
    }
}
