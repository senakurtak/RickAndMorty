//
//  BaseVC.swift
//  RickAndMortyApp
//
//  Created by Sena Kurtak on 6.03.2023.
//

import UIKit
import RxSwift
import SideMenu
class BaseVC<T>: UIViewController where T: BaseVM {

    var viewModel: T?
    let disposeBag = DisposeBag()
    let screen = UIScreen.main.bounds

    private let sideMenu = SideMenuNavigationController(rootViewController:
                                                            MenuController(with: ["Rick&Morty Store", "Ratings"]))

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configure()
        self.setUpView()
        self.setUpConstraints()
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }

    func configure() {
    }

    func setUpView() {
        navigationItem.largeTitleDisplayMode = .always
        self.navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .pewter
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "line.3.horizontal"),
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(buttonClickedForMenuView))
        navigationItem.rightBarButtonItem?.tintColor = .white
    }

    func setUpConstraints() {
    }

    @objc func buttonClickedForMenuView() {
        let menuVC = MenuController(with: ["Rick&Morty Store", "Ratings"])
        present(sideMenu, animated: true)
    }
}
