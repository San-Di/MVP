//
//  PetCategoryCollectionViewCell.swift
//  MVP
//
//  Created by Sandi on 10/5/19.
//  Copyright © 2019 Sandi. All rights reserved.
//

import UIKit
import SDWebImage

class PetCategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imgPet: UIImageView!
    
    @IBOutlet weak var lblPet: UILabel!
    
//    var mPetName: String?{
//        didSet{
//            lblPet.text = mPetName
//        }
//    }
//
//    var mPetImage: String? {
//        didSet{
//            let image: UIImage = UIImage(named: mPetImage!)!
//            imgPet.image = image
//        }
//    }
//
    var mData: CategoryVO?{
        didSet {
            lblPet.text = mData?.name
            imgPet.sd_setImage(with: URL(string: mData?.icon ?? ""), completed: nil)
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imgPet.layer.cornerRadius = 10
    }

}
