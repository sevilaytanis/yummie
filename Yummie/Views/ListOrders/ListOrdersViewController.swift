//
//  ListOrdersViewController.swift
//  Yummie
//
//  Created by sevilay tanis on 12.04.2023.
//

import UIKit
import ProgressHUD

class ListOrdersViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    var orders: [Order] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Orders"
        // Do any additional setup after loading the view.
        
        registerCells()
        
        }
    
    
    override func viewDidAppear(_ animated: Bool) {
        NetworkService.shared.fetchOrders { [weak self] (result) in
            switch result {
            case .success(let orders):
                ProgressHUD.dismiss()
                self?.orders = orders
                self?.tableView.reloadData()
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
    }
    
    private func registerCells()
    {
        tableView.register(UINib(nibName: DishListViewControllerTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListViewControllerTableViewCell.identifier)
    }

}

extension   ListOrdersViewController : UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListViewControllerTableViewCell.identifier) as!
            DishListViewControllerTableViewCell
//        cell.setUp(order: orders[indexPath.row])
       
        
        return cell
     }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailViewController.instantiate()
        controller.dish = orders[indexPath.row].dish 
        navigationController?.pushViewController(controller, animated: true)
    }
    
    
}
