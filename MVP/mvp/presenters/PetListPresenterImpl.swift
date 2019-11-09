//
//  PetListPresenterImpl.swift
//  MVP
//
//  Created by Sandi on 10/6/19.
//  Copyright © 2019 Sandi. All rights reserved.
//

import Foundation

import RxSwift
import RxCocoa


class PetListPresenterImpl: BasePresenter {
    
    let bag = DisposeBag()
    var mView: PetListView? = nil
    
    var categoryList: [CategoryVO] = []
    
    var catList: [CatVO] = []
}

extension PetListPresenterImpl: PetListPresenter{
    func onUIReady() {
//        RemoteModelImpl.shared.getAllCategoriesFromApi(success: { (data) in
//            self.categoryList = data
//            self.mView?.displayCategories(data: data)
//        }) { (error) in
//            self.mView?.displayError(error: error)
//        }
//
        
        let dataObs = RemoteModelImpl.shared.getAllCategoriesFromApiRx()
        
        dataObs
            .subscribeOn(ConcurrentDispatchQueueScheduler.init(queue: DispatchQueue.global()))
            .subscribe(onNext: {
            response in
            self.categoryList = response.data
            self.mView?.displayCategories(data: self.categoryList)
            
        }, onError: {
            error in
            self.mView?.displayError(error: error.localizedDescription)
            }).disposed(by: bag)
        
        
        let catListObs = RemoteModelImpl.shared.getAllCatsFromApiRx()
        
        catListObs
            .subscribeOn(ConcurrentDispatchQueueScheduler.init(queue: DispatchQueue.global()))
            .subscribe(onNext: {
                response in
                self.catList = response.data
                self.mView?.displayAllCats(data: self.catList)
            }, onError: {
                error in self.mView?.displayError(error: error.localizedDescription)
            }).disposed(by: bag)
    }
    
    func attachView(view: PetListView) {
        self.mView = view
    }
    
    
}
