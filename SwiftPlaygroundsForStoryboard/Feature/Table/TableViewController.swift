//
//  TableViewController.swift
//  SwiftPlaygroundsForStoryboard
//
//  Created by Hiromu Nakano on 2022/05/11.
//

import UIKit

class TableViewController: UITableViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()

        var config = cell.defaultContentConfiguration()
        config.text = indexPath.row.description
        cell.contentConfiguration = config

        return cell
    }
}
