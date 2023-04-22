//
//  ListDishesViewController.swift
//  Yummie
//
//  Created by sevilay tanis on 9.04.2023.
//

import UIKit
import ProgressHUD

class ListDishesViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    var category: DishCategory!
    
    var dishes:  [Dish]=[]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = category.name
        registerCells()
        
        ProgressHUD.show()
        NetworkService.shared.fetchCategoryDishes(categoryId: category.id ?? ""){
            [weak self] (result) in
            switch result {
            case .success(let dishes):
                ProgressHUD.dismiss()
                self?.dishes = dishes
                self?.tableView.reloadData()
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
        
    }
    
    private func registerCells(){
        tableView.register(UINib(nibName: DishListViewControllerTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListViewControllerTableViewCell.identifier)
    }
}

extension ListDishesViewController : UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListViewControllerTableViewCell.identifier) as! DishListViewControllerTableViewCell
        cell.setUp(dish: dishes[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailViewController.instantiate()
        controller.dish = dishes[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
    }
}
