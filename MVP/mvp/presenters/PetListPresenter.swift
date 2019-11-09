//
//  PetListPresenter.swift
//  MVP
//
//  Created by Sandi on 10/6/19.
//  Copyright © 2019 Sandi. All rights reserved.
//

import Foundation

protocol PetListPresenter {
    func onUIReady()
    func attachView(view: PetListView)
}
