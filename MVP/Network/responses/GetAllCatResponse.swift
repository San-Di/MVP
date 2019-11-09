//
//  GetAllCatResponse.swift
//  MVP
//
//  Created by Sandi on 11/9/19.
//  Copyright © 2019 Sandi. All rights reserved.
//

import Foundation

class GetAllCatResponse: Codable {
    
    var code: Int = 0
    var message: String = ""
    var data: [CatVO] = []
}
