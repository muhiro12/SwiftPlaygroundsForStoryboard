//
//  CollectionViewController.swift
//  SwiftPlaygroundsForStoryboard
//
//  Created by Hiromu Nakano on 2024/01/10.
//

import UIKit

class CollectionViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!

    private let id0 = "CollectionViewCell0"
    private let id1 = "CollectionViewCell1"
    private let id2 = "CollectionViewCell2"

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self

        collectionView.register(UICollectionViewCell.self,
                                forCellWithReuseIdentifier: id0)
        collectionView.register(UICollectionViewCell.self,
                                forCellWithReuseIdentifier: id1)
        collectionView.register(UICollectionViewCell.self,
                                forCellWithReuseIdentifier: id2)
    }
}

extension CollectionViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell0 = collectionView.dequeueReusableCell(withReuseIdentifier: id0, for: indexPath)
        let cell1 = collectionView.dequeueReusableCell(withReuseIdentifier: id1, for: indexPath)
        let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: id2, for: indexPath)

        switch indexPath.section {
        case 0:
            cell0.backgroundColor = .red
            return cell0
        case 1:
            cell1.backgroundColor = .blue
            return cell1
        case 2:
            cell2.backgroundColor = .green
            return cell2
        default:
            return UICollectionViewCell()
        }
    }
}
