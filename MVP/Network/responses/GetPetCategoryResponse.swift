//
//  GetPetCategoryResponse.swift
//  MVP
//
//  Created by Sandi on 10/6/19.
//  Copyright © 2019 Sandi. All rights reserved.
//

import Foundation

class GetPetCategoryResponse: Codable {
    
    var code: Int = 0
    var message: String = ""
    var data: [CategoryVO] = []
}
