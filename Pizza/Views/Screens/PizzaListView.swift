//
//  PizzaListView.swift
//  Pizza
//
//  Created by Chamath Peiris on 2022-05-10.
//

import SwiftUI

struct PizzaListView: View {
    
    @StateObject private var vm: ViewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            ZStack() {
                //vertical stack for categories
                VStack {
                    Picker(selection: $vm.selectedValue, label: Text("Category")) {
                        Text("All🍕").tag(PizzaType.all)
                        Text("Meat🥩").tag(PizzaType.meat)
                        Text("Veggie🥗").tag(PizzaType.vegetarian)
                    }.pickerStyle(SegmentedPickerStyle()).foregroundColor(Color.orange)
                    .pickerStyle(.segmented)
                    .padding()
                    .onChange(of: vm.selectedValue) { _ in
                        vm.fetchAndFilterData()
                    }
                    
                    //informed user when there is no pizza in the list
                    if(vm.pizzas.isEmpty){
                        VStack {
                            Spacer()
                            Text("No Pizzas")
                                .font(.system(size: 20.0, weight: Font.Weight.bold))
                            Spacer()
                        }
                    } else {
                        //show pizza list and have the function to delete a row
                        List {
                            ForEach(vm.pizzas, id: \.id) { pizza in
                                NavigationLink {
                                    PizzaDetailsView(pizza: pizza)
                                } label: {
                                    PizzaRow(pizza: pizza)
                                }
                            }.onDelete(perform: deletePizza)
                        }
                    }
                    Spacer()
                }
            }
            .navigationTitle("Pizza")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                //icon for adding new pizzas
                ToolbarItem {
                    Button(action: showSheet) {
                        Label("Add Item", systemImage: "plus")
                    }
                    .sheet(isPresented: $vm.showingSheet) {
                        AddPizzaView().onDisappear(perform: {
                            vm.fetchAndFilterData()
                        })
                    }
                }
            }
        }
    }
    
    private func deletePizza(at offsets: IndexSet) {
        offsets.forEach { index in
            let pizza = vm.pizzas[index]
            vm.delete(pizza: pizza)
        }
        
        vm.fetchAndFilterData()
    }
    
    private func showSheet() {
        vm.showingSheet.toggle()
    }
}

struct PizzaListView_Previews: PreviewProvider {
    static var previews: some View {
        PizzaListView()
    }
}
