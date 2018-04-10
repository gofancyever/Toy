//
//  OEToyHomeHerderView.swift
//  Toy
//
//  Created by gaof on 2018/4/10.
//  Copyright © 2018年 gaof. All rights reserved.
//

import UIKit
import Reusable
import LLCycleScrollView
class OEToyHomeHerderView: UICollectionReusableView,NibReusable {

    @IBOutlet weak var view_bander: LLCycleScrollView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.view_bander.imagePaths = ["timg (1)-1","timg (1)"]
    }
    
}
