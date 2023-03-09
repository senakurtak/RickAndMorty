//
//  LcoationCVC.swift
//  RickAndMortyApp
//
//  Created by Sena Kurtak on 9.03.2023.
//

import UIKit

class LocationCVC: UICollectionViewCell {
    
    static let cellIdentifier = "LocationCollectionViewCell"
    
    public var nameLabel : UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public var typeLabel : UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        contentView.backgroundColor = .darkSlateGray
        contentView.addSubviews(nameLabel, typeLabel)
        addConstraintLocation()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addConstraintLocation(){
        NSLayoutConstraint.activate([
            
            nameLabel.heightAnchor.constraint(equalToConstant: 20),
            typeLabel.heightAnchor.constraint(equalToConstant: 20),
            typeLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
            typeLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5),
            nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
            nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5),
            typeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            nameLabel.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: 20),
//            typeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -3),
//            nameLabel.bottomAnchor.constraint(equalTo: typeLabel.topAnchor, constant: -3),
        ])
        
        typeLabel.backgroundColor = .charcoal
        nameLabel.backgroundColor = .charcoal
        
    }
    override func prepareForReuse(){
        super.prepareForReuse()
        nameLabel.text = nil
        typeLabel.text = nil
    }
    
    public func configure(with viewModel: LocationCVCVM){
        nameLabel.text = viewModel.locationName
        typeLabel.text = viewModel.locationType
    }
    
    
}
