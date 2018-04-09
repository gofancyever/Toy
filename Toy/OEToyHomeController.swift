//
//  OEToyHomeController.swift
//  Toy
//
//  Created by gaof on 2018/4/9.
//  Copyright © 2018年 gaof. All rights reserved.
//

import UIKit
import Reusable
import SwiftyStarRatingView
class OEToyHomeController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var dataSource:[[String:String]] = {
        return [
            ["img":"timg","title":"犀牛"],
            ["img":"timg (1)","title":"千纸鹤"],
            ["img":"timg-1","title":"兔子"],
            ["img":"timg (2)","title":"鸡"],
            ["img":"1","title":"猪"],
        ]
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(cellType: OEToyHomeCell.self)
        collectionView.backgroundColor = #colorLiteral(red: 0.8682318065, green: 0.8719339534, blue: 0.8351746739, alpha: 1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
extension OEToyHomeController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let viewVC = OEToyDetailController.instantiate()
        self.navigationController?.pushViewController(viewVC, animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath) as OEToyHomeCell
        let data = self.dataSource[indexPath.row]
        cell.img_bg.image = UIImage(named:data["img"]!)
        cell.lab_title.text = data["title"]
        cell.grade.value = CGFloat(indexPath.row % 5)
        cell.lab_year.text = "\(indexPath.row % 12)"
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/4, height: collectionView.frame.width/4 * 1.3)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
