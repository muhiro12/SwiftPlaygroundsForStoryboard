//
//  FloatingBannerViewController.swift
//  SwiftPlaygroundsForStoryboard
//
//  Created by Hiromu Nakano on 2023/05/09.
//

import UIKit

protocol FloatingBannerViewDelegate {
    func floatingBannerView(_ floatingBannerView: FloatingBannerViewController, count: Void) -> Int
    func floatingBannerView(_ floatingBannerView: FloatingBannerViewController, didTapButton: Void)
}

class FloatingBannerViewController: UIViewController {
    @IBOutlet weak var label: UILabel!

    var delegate: FloatingBannerViewDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = delegate?.floatingBannerView(self, count: ()).description
    }

    @IBAction func didTapButton(_ sender: Any) {
        delegate?.floatingBannerView(self, didTapButton: ())
    }
}
