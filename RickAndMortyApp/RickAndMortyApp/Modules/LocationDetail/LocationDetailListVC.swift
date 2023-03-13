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
        
    var locations : [RMLocation]?
    let customNavBar = CustomNavigationBar()
    var detailedLocationId: Int?
    var detailedLocationName: String?
    var detailedLocationType: String?
    var detailedLocationDimension: String?
    var detailedLocationResidents: [String?] = [""]
    var detailedLocationUrl: String?
    var detailedLocationCreated: String?

    public var locationNameLabel : UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 36, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    public var locationTypeLabel : UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    public var locationDimensionLabel : UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .pewter        
        if let location = locations?.first{
            detailedLocationId = location.id
            detailedLocationName = location.name
            detailedLocationType = location.type
            detailedLocationDimension = location.dimension
            detailedLocationResidents = location.residents
            detailedLocationUrl = location.url
            detailedLocationCreated = location.created
        }
        locationNameLabelSetUp()
        locationTypeLabelSetUp()
        locationDimensionLabelSetUp()
        view.addSubviews(customNavBar)
        customNavBar.backButton.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
    }
    
    func locationNameLabelSetUp(){
        view.addSubview(locationNameLabel)
        locationNameLabel.text = detailedLocationName
        locationNameLabel.textAlignment = .center
        locationNameLabel.adjustsFontSizeToFitWidth = true
        locationNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        locationNameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        locationNameLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
    }
    
    func locationTypeLabelSetUp(){
        view.addSubview(locationTypeLabel)
        locationTypeLabel.text = detailedLocationType
        locationTypeLabel.textAlignment = .right
        locationTypeLabel.adjustsFontSizeToFitWidth = true
        locationTypeLabel.topAnchor.constraint(equalTo: locationNameLabel.bottomAnchor, constant: 50).isActive = true
        locationTypeLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        locationTypeLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
    }
    
    func locationDimensionLabelSetUp(){
        view.addSubview(locationDimensionLabel)
        locationDimensionLabel.text = detailedLocationDimension
        locationDimensionLabel.textAlignment = .left
        locationDimensionLabel.adjustsFontSizeToFitWidth = true
        locationDimensionLabel.topAnchor.constraint(equalTo: locationTypeLabel.bottomAnchor, constant: 50).isActive = true
        locationDimensionLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        locationDimensionLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
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
