//
//  CatListViewController.swift
//  MVP
//
//  Created by Sandi on 10/5/19.
//  Copyright © 2019 Sandi. All rights reserved.
//

import UIKit
import LGSideMenuController
import RxSwift
import RxCocoa

class CatListViewController: UIViewController {

    let petList = ["Cat", "Dog", "Parrot", "Bunnies", "Fish", "Barnyar"]
    let imgList = ["cat", "dog", "bird", "bunny", "fish", "cat"]
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var collectionViewPetCategory: UICollectionView!
    @IBOutlet weak var catListTableview: UITableView!
    
    private let mPresenter: PetListPresenterImpl = PetListPresenterImpl()
    
    let dummyData = Observable.of("1","2","3","4")
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        render()
        imgProfile.layer.cornerRadius = imgProfile.frame.height/2
        collectionViewPetCategory.delegate = self
        collectionViewPetCategory.dataSource = self

        catListTableview.delegate = self
        catListTableview.dataSource = self

        catListTableview.register(UINib(nibName: String(describing: PetItemTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: PetItemTableViewCell.self))
        collectionViewPetCategory.register(UINib(nibName: String(describing: PetCategoryCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: PetCategoryCollectionViewCell.self))

        let layout = collectionViewPetCategory.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: (collectionViewPetCategory.bounds.width - 25)/4 , height: 95)
        layout.minimumInteritemSpacing = 5

        mPresenter.attachView(view: self )
        mPresenter.onUIReady()
        
//        dummyData.asObservable().bind(to: catListTableview.rx.items)
    }
    
    @IBAction func onClickMenu(_ sender: Any) {
        let vc = (UIApplication.shared.keyWindow!.rootViewController) as! LGSideMenuController
        vc.showLeftViewAnimated()
    }
    
    

}
extension CatListViewController: PetListView{
    func displayAllCats(data: [CatVO]) {
        catListTableview.reloadData()
    }
    
    func displayCategories(data: [CategoryVO]) {
        collectionViewPetCategory.reloadData()
    }

    func displayError(error: String) {
        print("error \(error)")
    }

    
}
extension CatListViewController: UITableViewDelegate{
    
}

extension CatListViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mPresenter.catList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PetItemTableViewCell.self), for: indexPath) as! PetItemTableViewCell

        cell.mData = mPresenter.catList[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
}

extension CatListViewController: UICollectionViewDelegate{
    
}

extension CatListViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mPresenter.categoryList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: PetCategoryCollectionViewCell.self), for: indexPath) as! PetCategoryCollectionViewCell

        item.mData = mPresenter.categoryList[indexPath.row]
//        item.mPetName = petList[indexPath.row]
//        item.mPetImage = imgList[indexPath.row]
        return item
    }

}
