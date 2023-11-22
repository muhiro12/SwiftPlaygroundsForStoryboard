//
//  ProductDetailViewController.swift
//  SwiftPlaygroundsForStoryboard
//
//  Created by Hiromu Nakano on 2023/11/22.
//

import UIKit

class ProductDetailViewController: UIViewController {
    var product: Product!

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = product.name
        priceLabel.text = product.price.description
    }

    @IBAction func onButtonTapped(_ sender: Any) {
        dismiss(animated: true)
    }
}
