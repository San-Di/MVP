//
//  RemoteModel.swift
//  MVP
//
//  Created by Sandi on 10/6/19.
//  Copyright © 2019 Sandi. All rights reserved.
//

import Foundation
//Data model
import RxSwift
import RxCocoa

protocol RemoteModel {
    func getAllCategoriesFromApi(success: @escaping([CategoryVO]) -> Void, fail: @escaping(String) -> Void)
    
    func getAllCategoriesFromApiRx() -> Observable<GetPetCategoryResponse>
    
    func getAllCatsFromApiRx() -> Observable<GetAllCatResponse>
}
