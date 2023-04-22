//
//  DishDetailViewController.swift
//  Yummie
//
//  Created by sevilay tanis on 30.03.2023.
//

import UIKit
import ProgressHUD

class DishDetailViewController: UIViewController {

    @IBOutlet weak var DishImageView: UIImageView!
    @IBOutlet weak var DishTitleLabel: UILabel!
    @IBOutlet weak var desciptionLabel: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var nameField: UITextField!
    var dish: Dish!
    
    @IBAction func nameField(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        populateView()
    }
    private func populateView()
    {
        DishImageView.kf.setImage(with: dish.image?.asUrl)
        DishTitleLabel.text = dish.name
        desciptionLabel.text = dish.description
        caloriesLabel.text = dish.formatedCalories
    }
    @IBAction func placeOrderButtonClicked(_ sender: UIButton) {
        guard let name =
                nameField.text?.trimmingCharacters(in: .whitespaces),
              !name.isEmpty else {
            ProgressHUD.showError("Please enter your name")
            return
        }
        
        ProgressHUD.show("Placing Order....")
        NetworkService.shared.placeOrder(dishId: dish.id ?? "", name: name) {
            (result) in
            switch result {
            case .success(_):
                ProgressHUD.showSuccess("Your order has been received.👩‍🍳")
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
    }
}
