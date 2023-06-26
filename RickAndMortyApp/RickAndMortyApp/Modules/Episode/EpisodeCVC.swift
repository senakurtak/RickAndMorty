//
//  EpisodeCVC.swift
//  RickAndMortyApp
//
//  Created by Sena Kurtak on 9.03.2023.
//

import UIKit

final class EpisodeCVC: UICollectionViewCell {

    static let cellIdentifier = "EpisodeCollectionViewCell"

    public var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    public var airDateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    public var episodeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .pewterLight
        contentView.addSubviews(nameLabel, airDateLabel, episodeLabel)
        addConstraintEpisode()
    }

    private func addConstraintEpisode() {
        NSLayoutConstraint.activate([
            airDateLabel.heightAnchor.constraint(equalToConstant: 30),
            nameLabel.heightAnchor.constraint(equalToConstant: 30),
            airDateLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
            airDateLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5),
            nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
            nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5),
            episodeLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
            episodeLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5),

            airDateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -3),
            nameLabel.bottomAnchor.constraint(equalTo: airDateLabel.topAnchor, constant: -3),
            episodeLabel.bottomAnchor.constraint(equalTo: nameLabel.topAnchor, constant: -3)
        ])
        nameLabel.backgroundColor = .pewter
        airDateLabel.backgroundColor = .pewter
        episodeLabel.backgroundColor = .pewter
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = nil
        airDateLabel.text = nil
        episodeLabel.text = nil
    }

    public func configure(with viewModel: EpisodeCVCVM) {
        nameLabel.text = viewModel.episodeName
        airDateLabel.text = viewModel.episodeAirDateLabel
        episodeLabel.text = viewModel.episodeLabel
    }
}
