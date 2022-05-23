//
//  PizzaDetailsView.swift
//  Pizza
//
//  Created by Chamath Peiris on 2022-05-10.
//

import SwiftUI

struct PizzaDetailsView: View {
    
    let pizza: Pizza
    
    @StateObject private var vm: ViewModel = ViewModel()
    
    var body: some View {
        ScrollView {
            VStack {
                //design for pizza detauils with image
                ZStack {
                    Rectangle()
                        .fill(.secondary)
                    
                    ImageHelper.getSafeImage(pizza.image ?? "placeholder")
                        .resizable()
                        .scaledToFit()
                }
                .padding()
                
                Label("\(pizza.name ?? "")", systemImage: "")
                    .font(.title)
                    .padding(.horizontal)
                Label("\(pizza.ingredients ?? "")", systemImage: "")
                    .font(.body)
                    .padding(.horizontal)
                
                Label("\(pizza.type ?? "")", systemImage: "")
                    .font(.subheadline)
                    .padding(.horizontal)
                    .labelStyle(YellowBackgroundLabelStyle())
                Spacer()
            }.frame(maxWidth: .infinity, alignment: .leading)
                .toolbar {
                ToolbarItem {
                    Button(action: {
                        vm.shouldShowAlert = true
                        vm.isFavorite.toggle()
                        vm.addToFavorites(pizza: pizza)
                    }) {
                        //label for add pizzas to favourites
                        Label("", systemImage: vm.isFavorite ? "heart.fill" : "heart")
                    }
                }
            }
            .alert(isPresented: $vm.shouldShowAlert, content: {
                Alert(title: Text(vm.isFavorite ? "Pizza has been added to favorites" : "Pizza has been removed from favorites"), message: Text(""))
            })
        }
        .onAppear(perform: {
            vm.isFavorite = pizza.favorite
        })
    }
}
//
//struct PizzaDetailsView_Previews: PreviewProvider {
//
//    static var previews: some View {
//        PizzaDetailsView()
//    }
//}
struct YellowBackgroundLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        Label(configuration)
            .padding()
            .background(Color.yellow)
    }
}
