//
//  MainViewController.swift
//  SwiftPlaygroundsForStoryboard
//
//  Created by Hiromu Nakano on 2021/12/22.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    private let viewControllers = [
        UIStoryboard(name: "Banner", bundle: nil).instantiateInitialViewController()!,
        UIStoryboard(name: "Biometry", bundle: nil).instantiateInitialViewController()!,
        UIStoryboard(name: "Collection", bundle: nil).instantiateInitialViewController()!,
        UIStoryboard(name: "Hiragino", bundle: nil).instantiateInitialViewController()!,
        UIStoryboard(name: "PassKit", bundle: nil).instantiateInitialViewController()!,
        UIStoryboard(name: "Product", bundle: nil).instantiateInitialViewController()!,
        UIStoryboard(name: "Table", bundle: nil).instantiateInitialViewController()!,
        UIStoryboard(name: "TextField", bundle: nil).instantiateInitialViewController()!,
        UIStoryboard(name: "Web", bundle: nil).instantiateInitialViewController()!
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        title = String(describing: type(of: self))

        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewControllers.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let vc = viewControllers[indexPath.row]
        let cell = UITableViewCell()
        cell.textLabel?.text = String(describing: type(of: vc))
        return cell
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = viewControllers[indexPath.row]
        vc.title = String(describing: type(of: vc))
        navigationController?.pushViewController(vc, animated: true)
    }
}
