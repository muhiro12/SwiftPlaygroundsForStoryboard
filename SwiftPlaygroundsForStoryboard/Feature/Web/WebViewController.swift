//
//  WebViewController.swift
//  SwiftPlaygroundsForStoryboard
//
//  Created by Hiromu Nakano on 2023/05/17.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self
    }

    @IBAction func didTapGet(_ sender: Any) {
        var request = URLRequest(url: URL(string: "https://httpbin.org/get?id=identifier&pw=password")!)
        request.httpMethod = "GET"
        webView.load(request)
    }

    @IBAction func didTapPost(_ sender: Any) {
        let request = URLRequest(url: URL(string: "https://httpbin.org/pre_post")!)
        webView.load(request)
    }
}

extension WebViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        indicator.startAnimating()
    }

    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction) async -> WKNavigationActionPolicy {
        if (webView.url?.absoluteString == "https://httpbin.org/pre_post") {
            var request = URLRequest(url: URL(string: "https://httpbin.org/post")!)
            request.httpMethod = "POST"
            request.httpBody = "id=identifier&pw=password".data(using: .utf8)
            webView.load(request)
            return .cancel
        }
        return .allow
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        indicator.stopAnimating()
    }
}
