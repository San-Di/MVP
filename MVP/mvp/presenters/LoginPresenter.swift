//
//  LoginPresenter.swift
//  MVP
//
//  Created by Sandi on 10/5/19.
//  Copyright © 2019 Sandi. All rights reserved.
//

import Foundation

protocol LoginPresenter{
    
    func onClickGetStarted()
    
    // MAYDAY! attachView is to not highly coupled between view and presenter
    func attachView(view: LoginView)
    
    func onUIReady()
}
