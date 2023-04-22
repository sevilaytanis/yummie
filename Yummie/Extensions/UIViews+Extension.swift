//
//  UIViews+Extension.swift
//  Yummie
//
//  Created by sevilay tanis on 18.03.2023.
//

import UIKit

extension UIView{
   @IBInspectable var cornerRadius: CGFloat{
        get {return cornerRadius }
        set{
            self.layer.cornerRadius=newValue
        }
    }
}
