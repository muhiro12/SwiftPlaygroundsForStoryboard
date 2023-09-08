//
//  HiraginoViewController.swift
//  SwiftPlaygroundsForStoryboard
//
//  Created by Hiromu Nakano on 2023/09/08.
//

import UIKit

class HiraginoViewController: UIViewController {
    @IBOutlet weak var appleLabel: UILabel!
    @IBOutlet weak var googleLabel: UILabel!
    @IBOutlet weak var appleButton: UIButton!
    @IBOutlet weak var googleButton: UIButton!

    var attributes: [NSAttributedString.Key : Any]? {
        [.font: UIFont(name: "HiraginoSans-W6", size: 16)!]
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let label = UILabel()
        label.attributedText = .init(string: title!,
                                     attributes: attributes)
        navigationItem.titleView = label
    }

    @IBAction func didTapAppleButton(_ sender: Any) {
        presentMain()
    }

    @IBAction func didTapGoogleButton(_ sender: Any) {
        presentMain()
    }

    func presentMain() {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()!
        present(vc, animated: true)
    }
}
