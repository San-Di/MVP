//
//  PetListView.swift
//  MVP
//
//  Created by Sandi on 10/6/19.
//  Copyright © 2019 Sandi. All rights reserved.
//

import Foundation

protocol PetListView: BaseView {
    
    func displayCategories(data: [CategoryVO])
    func displayAllCats(data: [CatVO])
    func displayError(error: String) 
}
