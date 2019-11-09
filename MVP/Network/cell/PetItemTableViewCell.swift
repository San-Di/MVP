//
//  PetItemTableViewCell.swift
//  MVP
//
//  Created by Sandi on 10/6/19.
//  Copyright © 2019 Sandi. All rights reserved.
//

import UIKit
import SDWebImage

class PetItemTableViewCell: UITableViewCell {

    @IBOutlet weak var imgPet: UIImageView!
    
    @IBOutlet weak var viewContent: UIView!
    @IBOutlet weak var lblCatName: UILabel!
    
    @IBOutlet weak var lblCatAge: UILabel!
    
    @IBOutlet weak var lblCatType: UILabel!
    
    @IBOutlet weak var lblCatDistance: UILabel!
    
    
    var mData: CatVO?{
        didSet{
            imgPet.sd_setImage(with: URL(string: mData?.image ?? ""), completed: nil)
            lblCatAge.text = mData?.age
            lblCatType.text = mData?.type
            lblCatDistance.text = mData?.distance
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        
        imgPet.layer.cornerRadius = 10
//        viewContent.layer.cornerRadius = 10
        //        btnViewDetail.layer.cornerRadius = 10
        viewContent.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        viewContent.layer.cornerRadius = 10
//        viewContent.layer.cornerRadius = 20
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
