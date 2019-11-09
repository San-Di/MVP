//
//  LoginPresenterImpl.swift
//  MVP
//
//  Created by Sandi on 10/5/19.
//  Copyright © 2019 Sandi. All rights reserved.
//

import Foundation

class LoginPresenterImpl: BasePresenter {
    var mView: LoginView? = nil
    
}

extension LoginPresenterImpl: LoginPresenter {
    func attachView(view: LoginView) {
        mView = view
    }
    
    func onUIReady() {
        
    }
    
    func onClickGetStarted() {
        mView?.displayGreetingMessage(msg: "hola")
    }
}
