//
//  EpisodeListVC.swift
//  RickAndMortyApp
//
//  Created by Sena Kurtak on 9.03.2023.
//

import UIKit
import RxSwift
import RxCocoa

class EpisodeListVC: BaseVC<EpisodeVM> {
    
    private let episodeListView = EpisodeListView()
    
    var bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.fetchEpisode()
        title = "Episode"
        view.addSubview(episodeListView)
        collectionDataBinding()
        NSLayoutConstraint.activate([
            episodeListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            episodeListView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            episodeListView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            episodeListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func collectionDataBinding(){
        episodeListView.collectionView.register(EpisodeCVC.self,
                                                forCellWithReuseIdentifier: EpisodeCVC.cellIdentifier)
        
        
        self.episodeListView.collectionView.rx.setDelegate(self).disposed(by: disposeBag)
        viewModel!.episodeList.bind(to: episodeListView.collectionView.rx.items(cellIdentifier: EpisodeCVC.cellIdentifier, cellType: EpisodeCVC.self)) { (row, eps, cell) in
            var viewModel = EpisodeCVCVM(episodeName: eps.name ?? "", episodeAirDateLabel: eps.air_date ?? "", episodeLabel: eps.episode ?? "")
            cell.configure(with: viewModel)
        }
        .disposed(by: disposeBag)
        
        //MARK: DidSelect on Episode
        Observable
            .zip(episodeListView.collectionView.rx.itemSelected, episodeListView.collectionView.rx.modelSelected(RMEpisode.self))
            .bind { indexPath, model in
                self.viewModel?.goToDetail.onNext([model])
            } .disposed(by: disposeBag)
        
        
    }
}

extension EpisodeListVC : UICollectionViewDelegate{
    
}
