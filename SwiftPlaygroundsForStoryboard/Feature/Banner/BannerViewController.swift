//
//  BannerViewController.swift
//  SwiftPlaygroundsForStoryboard
//
//  Created by Hiromu Nakano on 2023/05/09.
//

import UIKit

class BannerViewController: UIViewController {
    private var count = 0

    private var banner: UIViewController {
        let vc = UIStoryboard(name: "Banner", bundle: nil).instantiateInitialViewController()!
        return vc
    }

    private var floating: UIViewController {
        let vc = UIStoryboard(name: "Banner", bundle: nil).instantiateViewController(withIdentifier: "FloatingBannerViewController") as! FloatingBannerViewController
        vc.delegate = self
        return vc
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func didTapPush(_ sender: Any) {
        navigationController?.pushViewController(banner, animated: true)
    }

    @IBAction func didTapPresent(_ sender: Any) {
        present(floating, animated: true)
    }
}

extension BannerViewController: FloatingBannerViewDelegate {
    func floatingBannerView(_ floatingBannerView: FloatingBannerViewController, count: Void) -> Int {
        self.count
    }

    func floatingBannerView(_ floatingBannerView: FloatingBannerViewController, didTapButton: Void) {
        floatingBannerView.dismiss(animated: true)
        switch count {
        case 0:
            count += 1
            navigationController?.pushViewController(banner, animated: true)
            present(floating, animated: true)
        case 1:
            count += 1
            present(floating, animated: true) {
                self.navigationController?.pushViewController(self.banner, animated: true)
            }
        default:
            count = 0
        }
    }
}
