//
//  Image.swift
//  Pizza
//
//  Created by Chamath Peiris on 2022-05-12.
//

import Foundation
import SwiftUI

class ImageHelper {
    static func getSafeImage(_ named: String) -> Image {
        //set placeholder image
       let uiImage =  (UIImage(named: named) ?? UIImage(named: "placeholder.png"))!
       return Image(uiImage: uiImage)
    }
}
