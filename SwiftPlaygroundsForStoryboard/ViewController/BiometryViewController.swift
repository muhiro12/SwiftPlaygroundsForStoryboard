//
//  BiometryViewController.swift
//  SwiftPlaygroundsForStoryboard
//
//  Created by Hiromu Nakano on 2021/12/22.
//

import UIKit
import LocalAuthentication

class BiometryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func tapButton(_ sender: Any) {
        DispatchQueue.main.async {
            self.biometry()
        }
    }

    private func biometry() {
        let context = LAContext()
        context.localizedFallbackTitle = ""
        context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: "biometry") { _, error in
            print(error ?? "")
            guard let laError = error as? LAError else {
                return
            }
            switch laError.code {
            case .biometryLockout:
                print("biometryLockout")
            default:
                print("default")
            }
        }
    }
}
