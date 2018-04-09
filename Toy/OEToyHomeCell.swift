//
//  OEToyHomeCell.swift
//  Toy
//
//  Created by gaof on 2018/4/9.
//  Copyright © 2018年 gaof. All rights reserved.
//

import UIKit
import Reusable
import SwiftyStarRatingView
class OEToyHomeCell: UICollectionViewCell,NibReusable {

    @IBOutlet weak var view_info: UIVisualEffectView!
    @IBOutlet weak var lab_year: UILabel!
    @IBOutlet weak var grade: SwiftyStarRatingView!
    @IBOutlet weak var lab_title: UILabel!
    @IBOutlet weak var img_bg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
