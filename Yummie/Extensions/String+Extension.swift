//
//  String+Extension.swift
//  Yummie
//
//  Created by sevilay tanis on 26.03.2023.
//

import Foundation

extension String {
    var asUrl: URL? {
        return URL(string: self)
    }
}
