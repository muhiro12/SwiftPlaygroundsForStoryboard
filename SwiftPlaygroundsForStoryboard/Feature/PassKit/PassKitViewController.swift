//
//  PassKitViewController.swift
//  SwiftPlaygroundsForStoryboard
//
//  Created by Hiromu Nakano on 2023/05/23.
//

import UIKit
import PassKit

class PassKitViewController: UIViewController {
    @IBOutlet weak var launchButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        updateButton()
    }

    @IBAction func didTapLaunch(_ sender: Any) {
        let config = PKAddPaymentPassRequestConfiguration(encryptionScheme: .RSA_V2)!
        config.cardholderName = "First Last"
        config.primaryAccountSuffix = "0000"
        let vc = PKAddPaymentPassViewController(requestConfiguration: config,
                                                delegate: self)!
        present(vc, animated: true)
    }

    private func updateButton() {
        if !PKAddPaymentPassViewController.canAddPaymentPass() {
            launchButton.isEnabled = false
            return
        }

        let library = PKPassLibrary()
        let isRegistered = library.passes().contains { pass in
            return false
        }

        if isRegistered {
            launchButton.isEnabled = false
            return
        }

        launchButton.isEnabled = true
    }
}

extension PassKitViewController: PKAddPaymentPassViewControllerDelegate {
    func addPaymentPassViewController(_ controller: PKAddPaymentPassViewController, generateRequestWithCertificateChain certificates: [Data], nonce: Data, nonceSignature: Data) async -> PKAddPaymentPassRequest {
        let request = PKAddPaymentPassRequest()
        return request
    }

    func addPaymentPassViewController(_ controller: PKAddPaymentPassViewController, didFinishAdding pass: PKPaymentPass?, error: Error?) {
    }
}
