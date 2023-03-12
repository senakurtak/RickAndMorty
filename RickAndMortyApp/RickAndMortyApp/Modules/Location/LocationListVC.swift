//
//  LocationListVC.swift
//  RickAndMortyApp
//
//  Created by Sena Kurtak on 9.03.2023.
//

import UIKit
import RxSwift
import RxCocoa

final class LocationListVC: BaseVC<LocationVM> {
    
    private let locationListView = LocationListView()

    var bag = DisposeBag()
//    var locations : [RMLocation]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.fetchLocation()
        view.addSubview(locationListView)
        title = "Location"
        collectionDataBinding()
        NSLayoutConstraint.activate([
            locationListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            locationListView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            locationListView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            locationListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func collectionDataBinding(){
        self.locationListView.collectionView.register(LocationCVC.self, forCellWithReuseIdentifier: LocationCVC.cellIdentifier)
        viewModel!.locationList.bind(to: locationListView.collectionView.rx.items(cellIdentifier: LocationCVC.cellIdentifier, cellType: LocationCVC.self)) { (row, loc, cell) in
            var viewModel = LocationCVCVM(locationName: loc.name ?? "", locationType: loc.type ?? "")
            print("Lokasyon ismi:\(loc.name)")
            cell.configure(with: viewModel)
        }
        .disposed(by: bag)
        
        //MARK: Location did select
        Observable
            .zip(locationListView.collectionView.rx.itemSelected, locationListView.collectionView.rx.modelSelected(RMLocation.self))
            .bind { indexPath, location in
                print("Location is: \(location.name)")
                self.viewModel?.goToDetailLocation.onNext([location])
            } .disposed(by: disposeBag)
    }
}

extension LocationListVC : UICollectionViewDelegate {
    
}
