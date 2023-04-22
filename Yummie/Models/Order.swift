//
//  Order.swift
//  Yummie
//
//  Created by sevilay tanis on 13.04.2023.
//

import Foundation

struct Order: Decodable{
    let id: String?
    let name: String?
    let dish: Dish?
}
