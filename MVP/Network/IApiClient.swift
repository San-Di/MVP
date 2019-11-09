//
//  IApiClient.swift
//  MVP
//
//  Created by Sandi on 10/6/19.
//  Copyright © 2019 Sandi. All rights reserved.
//

import Foundation
import RxSwift

protocol IApiClient {
    
    func getAllCategories(success: @escaping([CategoryVO]) -> Void, fail: @escaping(String) -> Void)
    
    func getAllCategoriesRx() -> Observable<GetPetCategoryResponse>
    
    func getAllCats() -> Observable<GetAllCatResponse>
}
