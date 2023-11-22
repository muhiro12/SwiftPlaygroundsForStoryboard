//
//  ProductListViewController.swift
//  SwiftPlaygroundsForStoryboard
//
//  Created by Hiromu Nakano on 2023/11/22.
//

import UIKit

struct Product {
    let name: String
    let price: Int
}

class ProductListViewController: UIViewController {
    private let products: [Product] = [
        .init(name: "Name1", price: 100),
        .init(name: "Name2", price: 200),
        .init(name: "Name3", price: 300),
        .init(name: "Name4", price: 400),
        .init(name: "Name5", price: 500)
    ]

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }

    private func product(at indexPath: IndexPath) -> Product {
        products[indexPath.row]
    }
}

extension ProductListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductListTableViewCell")!
        cell.textLabel?.text = product(at: indexPath).name
        cell.detailTextLabel?.text = product(at: indexPath).price.description
        return cell
    }
}

extension ProductListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "Product", bundle: nil).instantiateViewController(identifier: "ProductDetailViewController")
        (vc as! ProductDetailViewController).product = product(at: indexPath)
        present(vc, animated: true)
    }
}
