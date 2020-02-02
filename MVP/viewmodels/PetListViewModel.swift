//
//  PetListViewModel.swift
//  MVP
//
//  Created by Sandi on 11/9/19.
//  Copyright © 2019 Sandi. All rights reserved.
//

import Foundation

import RxSwift
import RxCocoa


class PetListViewModel: BaseViewModel {
    
    let bag = DisposeBag()
    public var isLoading: BehaviorRelay<Bool> = BehaviorRelay(value: false)
    
    public var _errorObs: BehaviorRelay<String?> = BehaviorRelay(value: nil)
    
    public var dataObs: PublishSubject<[CategoryVO]> = PublishSubject()
    
    public var catObs: PublishSubject<[CatVO]> = PublishSubject()
    let apiService = SharedApiClient.shared
    
    override init() {}
    
    
    public func requestData() {
        isLoading.accept(true)
        apiService.getAllCategoriesRx().subscribeOn(ConcurrentDispatchQueueScheduler.init(queue: DispatchQueue.global()))
            .subscribe(onNext: {
                respone in
                
                self.isLoading.accept(false)
                self.dataObs.onNext(respone.data)
            }, onError:{
                error in
                self.isLoading.accept(false)
                self._errorObs.accept(error.localizedDescription)
            }
        ).disposed(by: bag)
        
        
        apiService.getAllCats().subscribeOn(ConcurrentDispatchQueueScheduler.init(queue: DispatchQueue.global()))
            .subscribe(onNext: {
                response in
                self.isLoading.accept(false)
                self.catObs.onNext(response.data)
            }, onError: {
                error in
                self.isLoading.accept(false)
                self._errorObs.accept(error.localizedDescription)
            }).disposed(by: bag)
    }
}
