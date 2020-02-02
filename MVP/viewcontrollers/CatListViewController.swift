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
    
    var mCategoryList: [CategoryVO] = []
    var mCatList: [CatVO] = []
    let bag = DisposeBag()
    private let viewModel = PetListViewModel()
//    private let mPresenter: PetListPresenterImpl = PetListPresenterImpl()
    
    let dummyData = Observable.of("1","2","3","4")
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        render()
        imgProfile.layer.cornerRadius = imgProfile.frame.height/2
        collectionViewPetCategory.delegate = self
//        collectionViewPetCategory.dataSource = self

//        catListTableview.delegate = self
//        catListTableview.dataSource = self

        catListTableview.register(UINib(nibName: String(describing: PetItemTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: PetItemTableViewCell.self))
        collectionViewPetCategory.register(UINib(nibName: String(describing: PetCategoryCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: PetCategoryCollectionViewCell.self))

        let layout = collectionViewPetCategory.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: (collectionViewPetCategory.bounds.width - 25)/4 , height: 95)
        layout.minimumInteritemSpacing = 5
        
        initDataObservation()
        
        viewModel.requestData()

//        mPresenter.attachView(view: self )
//        mPresenter.onUIReady()
        
//        dummyData.asObservable().bind(to: catListTableview.rx.items)
    }
    
    private func initDataObservation(){
//        viewModel.dataObs.observeOn(MainScheduler.instance)
//            .subscribe(onNext: {
//                data in
//                self.bindCategory(category: data)
//            }).disposed(by: bag)
        
        viewModel.dataObs.observeOn(MainScheduler.instance)
            .bind(to: collectionViewPetCategory.rx.items) {
                collectionView, index, item in
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: PetCategoryCollectionViewCell.self), for: IndexPath(row: index, section: 0)) as! PetCategoryCollectionViewCell
                
                cell.mData = item
                
                return cell
        }.disposed(by: bag)
        
        Observable
            .zip(collectionViewPetCategory.rx.itemSelected, collectionViewPetCategory.rx.modelSelected(CategoryVO.self))
            .bind{
                indexPath, model in
                self.collectionViewPetCategory.deselectItem(at: indexPath, animated: true)
                print("Selected " + model.name + " at \(indexPath)")
        }.disposed(by: bag)
//
//        viewModel.catObs.observeOn(MainScheduler.instance)
//            .subscribe(onNext: {
//                data in
//                self.bindCatList(catList: data)
//            }).disposed(by: bag)
//
        viewModel.catObs.observeOn(MainScheduler.instance)
            .bind(to: catListTableview.rx.items) {
                tableView, index, item in
                let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PetItemTableViewCell.self), for: IndexPath(row: index, section: 0)) as! PetItemTableViewCell
                
                cell.mData = item
                
//                cell.heightAnchor = NSLayoutAnchor(
                return cell
        }.disposed(by: bag)
        
        
        
        catListTableview.rx.modelSelected(CatVO.self)
            .subscribe(onNext: { value in
                print(value.age)
                print(value.distance)
                print(value.image)
            }).disposed(by: bag)
        
        
        Observable
            .zip(catListTableview.rx.itemSelected, catListTableview.rx.modelSelected(CatVO.self))
            .bind { indexPath, model in
                self.catListTableview.deselectRow(at: indexPath, animated: true)
                print("Selected " + model.type + " at \(indexPath)")
                
        }.disposed(by: bag)
    }
    
    func bindCatList(catList: [CatVO]){
        self.mCatList = catList
        self.catListTableview.reloadData()
    }
    func bindCategory(category: [CategoryVO]) {
        self.mCategoryList = category
        self.collectionViewPetCategory.reloadData()
    }
    @IBAction func onClickMenu(_ sender: Any) {
        let vc = (UIApplication.shared.keyWindow!.rootViewController) as! LGSideMenuController
        vc.showLeftViewAnimated()
    }
    
    

}
//extension CatListViewController: PetListView{
//    func displayAllCats(data: [CatVO]) {
//        catListTableview.reloadData()
//    }
//
//    func displayCategories(data: [CategoryVO]) {
//        collectionViewPetCategory.reloadData()
//    }
//
//    func displayError(error: String) {
//        print("error \(error)")
//    }
//
//
//}
//extension CatListViewController: UITableViewDelegate{
//
//}
//
//extension CatListViewController: UITableViewDataSource{
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return mCatList.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PetItemTableViewCell.self), for: indexPath) as! PetItemTableViewCell
//
//
//        cell.mData = mCatList[indexPath.row]
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 180
//    }
//
//}

extension CatListViewController: UICollectionViewDelegate{

}

//extension CatListViewController: UICollectionViewDataSource{
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return mCategoryList.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let item = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: PetCategoryCollectionViewCell.self), for: indexPath) as! PetCategoryCollectionViewCell
//
//        item.mData = mCategoryList[indexPath.row]
//        item.mData = mPresenter.categoryList[indexPath.row]
//        item.mPetName = petList[indexPath.row]
//        item.mPetImage = imgList[indexPath.row]
//        return item
//    }

//}
