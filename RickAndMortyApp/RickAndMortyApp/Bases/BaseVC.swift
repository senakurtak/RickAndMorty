//
//  BaseVC.swift
//  RickAndMortyApp
//
//  Created by Sena Kurtak on 6.03.2023.
//

import UIKit
import RxSwift
import SideMenu
class BaseVC<T>: UIViewController where T : BaseVM {
    
    var viewModel : T?
    let disposeBag = DisposeBag()
    let screen = UIScreen.main.bounds
//    private let color = UIColor(red: 33/255.0, green: 33/255.0, blue: 33/255.0, alpha: 33/255.0)
    
    private let sideMenu = SideMenuNavigationController(rootViewController: MenuController(with: ["Production","Ratings","Analysis"]))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configure()
        self.setUpView()
        self.setUpConstraints()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return UIStatusBarStyle.lightContent
    }
    
    func configure() {
    }
    
    func setUpView() {
        navigationItem.largeTitleDisplayMode = .always
        self.navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Menu", style: .plain, target: self, action: #selector(buttonClickedForMenuView))
    }
    
    func setUpConstraints() {
    }
    
    @objc func buttonClickedForMenuView(){
        let vc = MenuController(with: ["Production","Ratings","Analysis"])
        present(sideMenu, animated: true)
    }
}
