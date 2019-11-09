//
//  RemoteModelImpl.swift
//  MVP
//
//  Created by Sandi on 10/6/19.
//  Copyright © 2019 Sandi. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class RemoteModelImpl: BaseModel {
    static let shared = RemoteModelImpl()
    
    private override init() {}
}

extension RemoteModelImpl: RemoteModel{
    func getAllCatsFromApiRx() -> Observable<GetAllCatResponse> {
        return SharedApiClient.shared.getAllCats()
    }
    
    func getAllCategoriesFromApiRx() -> Observable<GetPetCategoryResponse> {
        return SharedApiClient.shared.getAllCategoriesRx()
    }
    
    
    func getAllCategoriesFromApi(success: @escaping ([CategoryVO]) -> Void, fail: @escaping (String) -> Void) {
        SharedApiClient.shared.getAllCategories(success: { (data) in
            success(data)
        }) { (error) in
            fail(error)
        }
    }
    
    
}
