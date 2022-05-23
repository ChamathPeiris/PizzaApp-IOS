//
//  PizzaRow.swift
//  Pizza
//
//  Created by Chamath Peiris on 2022-05-10.
//

import SwiftUI

struct PizzaRow: View {
    
    let pizza: Pizza
    
    var body: some View {
        //horizontal stack for a pizza row
        HStack {
            ImageHelper.getSafeImage(pizza.image ?? "placeholder")
                .resizable()
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .frame(width: 75.0, height: 75.0)
                
            Text("\(pizza.name ?? "")")

            Spacer()
        }
    }
    
    

}
