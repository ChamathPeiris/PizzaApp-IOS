//
//  HomeView.swift
//  Pizza
//
//  Created by Chamath Peiris on 2022-05-08.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        //tabview for dividing pizza list as allthe pizza list and favourite pizza list
        TabView {
            PizzaListView()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("PizzaList")
            }
            FavouriteView()
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Favourites")
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
