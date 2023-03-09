//
//  LocationListView.swift
//  RickAndMortyApp
//
//  Created by Sena Kurtak on 9.03.2023.
//

import UIKit
import RxSwift
import RxCocoa
import Foundation

final class LocationListView: UIView {
    
    private let viewModel = LocationVM()
    var bag = DisposeBag()
    
    private let spinner : UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    public let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset =  UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isHidden = true
        collectionView.alpha = 0
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(LocationCVC.self, forCellWithReuseIdentifier: LocationCVC.cellIdentifier)
        collectionView.backgroundColor = .pewter
        return collectionView
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        addSubviews(collectionView, spinner)
        addConstraints()
        spinner.startAnimating()
        viewModel.fetchLocation()
        collectionDataBinding()
        setUpCollectionViewConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionDataBinding(){
        self.collectionView.register(LocationCVC.self, forCellWithReuseIdentifier: LocationCVC.cellIdentifier)
        viewModel.locationList.bind(to: collectionView.rx.items(cellIdentifier: LocationCVC.cellIdentifier, cellType: LocationCVC.self)) { (row, loc, cell) in
            var viewModel = LocationCVCVM(locationName: loc.name ?? "", locationType: loc.type ?? "")
            print("Lokasyon ismi:\(loc.name)")
            cell.configure(with: viewModel)
        }
        .disposed(by: bag)
    }
    
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            spinner.widthAnchor.constraint(equalToConstant: 100),
            spinner.heightAnchor.constraint(equalToConstant: 100),
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor),
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    private func setUpCollectionViewConstraint(){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        getDeviceSize()
        layout.itemSize = CGSize(width: screenWidth * 0.90, height: screenWidth * 0.2)
        collectionView.setCollectionViewLayout(layout, animated: true)
        DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: {
            self.spinner.stopAnimating()
            self.collectionView.isHidden = false
            UIView.animate(withDuration: 0.4) {
                self.collectionView.alpha = 1
            }
        })
    }
}
