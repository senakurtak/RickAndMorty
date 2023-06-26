//
//  BaseVM.swift
//  RickAndMortyApp
//
//  Created by Sena Kurtak on 6.03.2023.
//

import Foundation
import RxSwift
import Moya

class BaseVM: NSObject {
    let showLoading = BehaviorSubject<Bool>(value: false)
    var error = PublishSubject<String>()
    let disposeBag = DisposeBag()

    func showFailError(error: Error) {
        do {
            let errorRes = error as? Moya.MoyaError
            if let body = try errorRes?.response?.mapJSON() {
                self.error
                    .onNext("Bilinmeyen bir hata oluştu. Daha sonra tekrar deneyin!.")
                return
            }
            if errorRes?.response?.statusCode ?? 200 >= 500 {
                self.error
                    .onNext("İşlem başarısız. Bilinmeyen bir hata oluştu.")
            }
        } catch {
            print(error)
        }
    }
}
