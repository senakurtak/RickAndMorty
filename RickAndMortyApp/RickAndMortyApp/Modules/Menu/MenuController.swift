//
//  MenuController.swift
//  RickAndMortyApp
//
//  Created by Sena Kurtak on 1.03.2023.
//

import UIKit
import SideMenu
import RxSwift

class MenuController: UITableViewController {
    
    private let menuItems : [String]
    
    override func viewDidLoad() {
        tableView.backgroundColor = .orgDarkGray
        view.backgroundColor = .orgDarkGray
        
    }
    
    init(with menuItems: [String]){
        self.menuItems = menuItems
        super.init(nibName: nil, bundle: nil)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        menuItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = menuItems[indexPath.row]
        cell.textLabel?.textColor = .white
        cell.backgroundColor = .orgDarkGray
        cell.contentView.backgroundColor = .pewter
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedItem = menuItems[indexPath.item]
        switch selectedItem {
        case "Production":
        case "Ratings":
            var ratingVC = RatingWebViewController()
            navigationController?.pushViewController(ratingVC, animated: true)
            break
        case "Analysis":
            break
        default:
            break
        }
        dismiss(animated: true, completion: nil)
    }
}
