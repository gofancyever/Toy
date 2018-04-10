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
import Hero
import IBAnimatable
class OEToyHomeCell: AnimatableCollectionViewCell,NibReusable {

    @IBOutlet weak var view_info: UIVisualEffectView!
    @IBOutlet weak var grade: SwiftyStarRatingView!

    @IBOutlet weak var lab_year_title: UILabel!
    @IBOutlet weak var lab_year: UILabel!
    @IBOutlet weak var lab_grade: UILabel!
    @IBOutlet weak var lab_title: UILabel!
    @IBOutlet weak var img_bg: UIImageView!
    var indexPath:IndexPath? {
        didSet {
            img_bg.hero.id = "toy_img_\(indexPath!.item)"
            lab_title.hero.id = "toy_title_\(indexPath!.item)"
            view_info.hero.id = "toy_info_\(indexPath!.item)"
            lab_year.hero.id = "toy_year_\(indexPath!.item)"
            grade.hero.id = "toy_grade_\(indexPath!.item)"
            lab_year_title.hero.id = "toy_year_title_\(indexPath!.item)"
            lab_grade.hero.id = "toy_grade_title_\(indexPath!.item)"
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

}
