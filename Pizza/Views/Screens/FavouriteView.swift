//
//  FavouriteView.swift
//  Pizza
//
//  Created by Chamath Peiris on 2022-05-10.
//

import SwiftUI

struct FavouriteView: View {
    
    @StateObject private var vm: ViewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if(vm.pizzas.isEmpty){
                    Spacer()
                    Text("No Favourite Pizzas")
                        .font(.system(size: 20.0, weight: Font.Weight.bold))
                    Spacer()
                } else {
                    //show favourite pizza list
                    List {
                        ForEach(vm.pizzas, id: \.id) { pizza in
                            NavigationLink {
                                PizzaDetailsView(pizza: pizza)
                            } label: {
                                PizzaRow(pizza: pizza)
                            }
                        }
                    }
                    
                }
            }
            .navigationTitle("Favorites")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear(perform: vm.fetchAllData)
        }
    }
}

struct FavouriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteView()
    }
}
