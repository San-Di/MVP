//
//  CategoryVO.swift
//  MVP
//
//  Created by Sandi on 10/6/19.
//  Copyright © 2019 Sandi. All rights reserved.
//

import Foundation

class CategoryVO: Codable {
    var id: Int = 0
    var name: String = ""
    var icon: String = ""
    
    enum CodingKeys: String, CodingKey {
        
        case id, name, icon
    }
}
