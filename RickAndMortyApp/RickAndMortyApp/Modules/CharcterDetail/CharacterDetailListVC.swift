//
//  CharacterDetailListVC.swift
//  RickAndMortyApp
//
//  Created by Sena Kurtak on 12.03.2023.
//

import Foundation
import RxCocoa
import RxSwift
import UIKit

class CharacterDetailListVC: BaseVC<CharacterDetailVM> {

    var characterItems: [RMCharacter]?
    let customNavBar = CustomNavigationBar()
    var detailedChrId: Int?
    var detailedChrName: String?
    var detailedChrStatus: RMCharacterStatus?
    var detailedChrSpecies: String?
    var detailedChrType: String?
    var detailedChrGender: String?
    var detailedChrOrigin: RMOrigin?
    var detailedChrLocation: RMSingleLocation?
    var detailedChrImage: String?
    var detailedChrEpisode: [String] = [""]
    var detailedChrUrl: String?
    var detailedChrCreated: String?
    var detailViewModel = CharacterDetailVM()

    public var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 10
        return stackView
    }()

    public var chrNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 36, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    public var chrStatusLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    public var chrSpecies: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    public var chrGender: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    public var chrOrigin: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    public var chrImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    public var chrLocation: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .pewter
        if let character = characterItems?.first {
            detailedChrId = character.id
            detailedChrName = character.name
            detailedChrStatus = character.status
            detailedChrSpecies = character.species
            detailedChrType = character.type
            detailedChrGender = character.gender
            detailedChrOrigin = character.origin
            detailedChrLocation = character.location
            detailedChrImage = character.image
            detailedChrEpisode = character.episode
            detailedChrUrl = character.url
            detailedChrCreated = character.created
        }
        view.addSubview(customNavBar)
        chrNameLabelSetUp()
        chrStatusLabelSetUp()
        chrGenderLabelSetUp()
        chrOriginLabelSetUp()
        chrLocationLabelSetUp()
        imageSetUp()
        customNavBar.backButton.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
        view.addSubview(stackView)
        stackView.addArrangedSubview(chrImageView)
        stackView.addArrangedSubview(chrNameLabel)
        stackView.addArrangedSubview(chrGender)
        stackView.addArrangedSubview(chrSpecies)
        stackView.addArrangedSubview(chrOrigin)
        stackView.addArrangedSubview(chrLocation)
        stackView.addArrangedSubview(chrStatusLabel)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])

    }

    func imageSetUp() {
        view.addSubview(chrImageView)
        let urlString = "https://rickandmortyapi.com/api/character/avatar/1.jpeg"
        detailViewModel.fetchImage(chrImgURL: URL(string: detailedChrImage ?? urlString)) { [weak self] result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    let image = UIImage(data: data)
                    self?.chrImageView.image = image
                }
            case .failure(let error):
                print(String(describing: error))
                break
            }
        }
        chrImageView.translatesAutoresizingMaskIntoConstraints = false
        chrImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true

    }
    func chrNameLabelSetUp() {
        view.addSubview(chrNameLabel)
        chrNameLabel.text = detailedChrName
        chrNameLabel.textAlignment = .center
        chrNameLabel.adjustsFontSizeToFitWidth = true
    }
    func chrStatusLabelSetUp() {
        view.addSubview(chrStatusLabel)
        chrStatusLabel.text = detailedChrStatus?.rawValue
        chrStatusLabel.textAlignment = .left
        chrStatusLabel.adjustsFontSizeToFitWidth = true
    }
    func chrGenderLabelSetUp() {
        view.addSubview(chrGender)
        chrGender.text = detailedChrGender
        chrGender.textAlignment = .left
        chrGender.adjustsFontSizeToFitWidth = true
    }
    func chrOriginLabelSetUp() {
        view.addSubview(chrOrigin)
        chrOrigin.text = detailedChrOrigin?.name
        chrOrigin.textAlignment = .left
        chrOrigin.adjustsFontSizeToFitWidth = true
    }
    func chrLocationLabelSetUp() {
        view.addSubview(chrLocation)
        chrLocation.text = detailedChrLocation?.name
        chrLocation.textAlignment = .left
        chrLocation.adjustsFontSizeToFitWidth = true
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let customNavBarSize = CGSize(width: view.bounds.width, height: 88)
        customNavBar.frame = CGRect(origin: CGPoint(x: 0, y: view.safeAreaInsets.top), size: customNavBarSize)
    }

    @objc private func didTapBackButton() {
        navigationController?.popViewController(animated: true)
    }
}
