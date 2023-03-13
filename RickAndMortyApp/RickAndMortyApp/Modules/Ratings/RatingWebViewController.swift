//
//  WebViewController.swift
//  RickAndMortyApp
//
//  Created by Sena Kurtak on 13.03.2023.
//

import UIKit
import WebKit

class RatingWebViewController: UIViewController, WKNavigationDelegate {
    
    let customNavBar = CustomNavigationBar()
    var webView: WKWebView!
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
        view.backgroundColor = .pewter
        view.addSubview(customNavBar)
        customNavBar.backButton.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://www.imdb.com/title/tt2861424/")!
        webView.load(URLRequest(url: url))
        webView.backgroundColor = .pewter
    }
    
    @objc private func didTapBackButton() {
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let customNavBarSize = CGSize(width: view.bounds.width, height: 88)
        customNavBar.frame = CGRect(origin: CGPoint(x: 0, y: view.safeAreaInsets.top), size: customNavBarSize)
        customNavBar.backButton.tintColor = .red
    }
    override func viewWillAppear(_ animated: Bool) {
        view.backgroundColor = .pewter
    }
}
