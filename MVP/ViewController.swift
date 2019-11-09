//
//  ViewController.swift
//  MVP
//
//  Created by Sandi on 10/5/19.
//  Copyright © 2019 Sandi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var btnGetStarted: UIButton!
    
    //1. declare a presenter
    private let mPresenter: LoginPresenterImpl = LoginPresenterImpl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnGetStarted.layer.cornerRadius = 20
        
        //2. attatch View (connect viewcontroller and preseneter)
        //MAYDAY! if u wann pass argument 'self' to bind viewcontroller & presenter through view, then U need to extend Protocol view (login view) 
        mPresenter.attachView(view: self)
    }
    @IBAction func btnGetStarted(_ sender: Any) {
        mPresenter.onClickGetStarted()
    }
   
}

extension ViewController: LoginView {
    func displayGreetingMessage(msg: String) {
        print(" MSG => \(msg)")
    }
    
    
}
