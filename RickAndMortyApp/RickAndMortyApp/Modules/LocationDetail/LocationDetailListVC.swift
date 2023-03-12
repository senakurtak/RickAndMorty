//
//  LocationDetailListVC.swift
//  RickAndMortyApp
//
//  Created by Sena Kurtak on 12.03.2023.
//
import UIKit
import Foundation
import RxCocoa
import RxSwift

class LocationDetailVC: BaseVC<LocationDetailVM>{
    
    private var locationDetailListView = LocationDetailListView()
    
    var locations : [RMLocation]?
    
    let customNavBar = CustomNavigationBar()

    var detailedLocationId: Int?
    var detailedLocationName: String?
    var detailedLocationType: String?
    var detailedLocationDimension: String?
    var detailedLocationResidents: [String?] = [""]
    var detailedLocationUrl: String?
    var detailedLocationCreated: String?

    
    public var idLabel : UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        print(locations)
        
        if let location = locations?.first{
            detailedLocationId = location.id
            detailedLocationName = location.name
            detailedLocationType = location.type
            detailedLocationDimension = location.dimension
            detailedLocationResidents = location.residents
            detailedLocationUrl = location.url
            detailedLocationCreated = location.created
        }
        
        print("Selected Location Details are: \(detailedLocationId),\(detailedLocationName),\(detailedLocationType),\(detailedLocationDimension),\(detailedLocationResidents),\(detailedLocationUrl),\(detailedLocationCreated)")

        
        view.addSubviews(customNavBar)
        customNavBar.backButton.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // Layout custom navigation bar
        let customNavBarSize = CGSize(width: view.bounds.width, height: 88)
        customNavBar.frame = CGRect(origin: CGPoint(x: 0, y: view.safeAreaInsets.top), size: customNavBarSize)
    }
    
    
    @objc private func didTapBackButton() {
        navigationController?.popViewController(animated: true)
    }
}
