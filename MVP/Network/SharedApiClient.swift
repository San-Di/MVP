//
//  SharedApiClient.swift
//  MVP
//
//  Created by Sandi on 10/6/19.
//  Copyright © 2019 Sandi. All rights reserved.
//

import Foundation
import SwiftyJSON
import RxSwift
import RxCocoa

class SharedApiClient: BaseApiClient {
    
    // MARK: - Properties
    
    static let shared = SharedApiClient()
    
    // Initialization
    
    private override init() {
        
    }
}

extension SharedApiClient: IApiClient {
    func getAllCategoriesRx() -> Observable<GetPetCategoryResponse> {
        
        let obs = self.requestApiWithHeaders2( url:Routes.ROUTE_GET_PET_CATEGORIES, method: .get, params: [:], value: GetPetCategoryResponse.self)
        
        return obs
    }
    
    func getAllCategories(success: @escaping ([CategoryVO]) -> Void, fail: @escaping (String) -> Void) {
        self.requestApiWithHeaders(url: generateUrl(route: Routes.ROUTE_GET_PET_CATEGORIES), method: .get, params: [:], success: { (response) in
            
            let decoder = JSONDecoder()
            
            do {
                let apiResponse = try decoder.decode(GetPetCategoryResponse.self, from: response)
                success(apiResponse.data)
            }catch{
                print(error.localizedDescription)
            }
            
        }) { (err) in
            fail(err.localizedCapitalized)
        }
    }
    
    func getAllCats() -> Observable<GetAllCatResponse> {
        let obs = self.requestApiWithHeaders2(url: Routes.ROUTE_GET_ALL_CATS, method: .post, params: ["category_id": 1], value: GetAllCatResponse.self)
        
        return obs
    }
    
    
}
