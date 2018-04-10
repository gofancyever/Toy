//
//  OEStoreHomeCell.swift
//  Toy
//
//  Created by gaof on 2018/4/10.
//  Copyright © 2018年 gaof. All rights reserved.
//

import UIKit
import Reusable
class OEStoreHomeCell: UICollectionViewCell,NibReusable {

    @IBOutlet weak var lab_price: UILabel!
    @IBOutlet weak var lab_name: UILabel!
    @IBOutlet weak var img_bg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
