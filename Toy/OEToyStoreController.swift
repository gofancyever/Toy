//
//  OEToyStoreController.swift
//  Toy
//
//  Created by gaof on 2018/4/10.
//  Copyright © 2018年 gaof. All rights reserved.
//

import UIKit
import Reusable
import Hero
import LLCycleScrollView
class OEToyStoreController: UIViewController {
    
    @IBOutlet weak var height_header: NSLayoutConstraint!
    @IBOutlet weak var headerView: LLCycleScrollView!
    @IBOutlet weak var collectionView: UICollectionView!
    var dataSource:[[String:String]] = [
        ["img":"timg (3)","title":"多色纸张"],
        ["img":"timg (4)","title":"无毒胶水"],
        ["img":"timg (5)","title":"可食用颜料"],
        
    ]
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(cellType: OEStoreHomeCell.self)
        
        headerView.imagePaths = ["timg (3)","timg (4)","timg (5)"]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
extension OEToyStoreController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath) as OEStoreHomeCell
        let data = self.dataSource[indexPath.item % 3]
        cell.img_bg.image = UIImage(named:data["img"]!)
        cell.lab_name.text = data["title"]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2-16, height: (collectionView.frame.width/2-16) * 1.3)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
 
}
