//
//  CardView.swift
//  Yummie
//
//  Created by sevilay tanis on 26.03.2023.
//


import UIKit

class CardView: UIView{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialSetup()
    }
    
    private func initialSetup(){
        layer.shadowColor=UIColor.black.cgColor
        layer.shadowOffset = .zero
        layer.cornerRadius=10
        layer.shadowOpacity = 0.1
        layer.shadowRadius = 10
        cornerRadius = 10
    }
}
