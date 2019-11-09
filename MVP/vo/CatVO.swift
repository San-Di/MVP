//
//  CatVO.swift
//  MVP
//
//  Created by Sandi on 11/9/19.
//  Copyright © 2019 Sandi. All rights reserved.
//

import Foundation


class CatVO: Codable {
    var image: String = ""
    var type: String = ""
    var age: String = ""
    var distance: String = ""
    var gender: String = ""
    
    enum CodingKeys: String, CodingKey {
        
        case image, type, age, distance, gender
    }
}
