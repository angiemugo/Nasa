//
//  BaseViewModel.swift
//  Nasa
//
//  Created by Angie Mugo on 21/11/2021.
//

import RxSwift
import RxCocoa

class BaseViewModel {
    let disposeBag = DisposeBag()
    let errorRelay = PublishRelay<Error>()
    let loadingRelay = PublishRelay<Bool>()
}
